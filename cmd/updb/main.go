package main;

import (
	"fmt"
	"path/filepath"
	"os"
	log "github.com/sirupsen/logrus"
    "github.com/golang-migrate/migrate/v4"
	_ "github.com/golang-migrate/migrate/v4/database/mysql"
	_ "github.com/golang-migrate/migrate/v4/source/file"
	. "github.com/upsilonproject/upsilon-database-sql/internal/config"
	"github.com/spf13/cobra"
)

var (
	rootCmd = &cobra.Command {
		Use: "updb",
	}
)

func initFlags() {
	rootCmd.PersistentFlags().StringP("dbHost", "", "Database Host", "The hostname of the database to connect to")
	rootCmd.PersistentFlags().IntP("force", "", 0, "Force version")
}

func findDbDirectory() string {
	path := "/usr/share/upsilon-database-sql/mysql/migrations";

	if _, err := os.Stat(path); !os.IsNotExist(err) {
		return path;
	}

	path, _ = filepath.Abs("./mysql/migrations");

	return path;
}

func main() {
	initFlags();
	InitConfig(rootCmd);

	rootCmd.Execute()

	conf := GetConfig();

	mysqlUri := fmt.Sprintf("mysql://%v:%v@tcp(%v)/%v", conf.Database.User, conf.Database.Pass, conf.Database.Host, conf.Database.Name)

	log.Infof("conf: %+v", conf);
	log.Infof("db: %v", mysqlUri)

	migrationsDirectory := findDbDirectory();
	log.Infof("Migrations directory: %s", migrationsDirectory);


	m, err := migrate.New(
		"file://" + migrationsDirectory,
		mysqlUri,
	)

	if err != nil {
		log.Error("init errors:", err);
	} else {
		ver, dirty, err := m.Version()

		log.Info("version before migration:", ver);

		if (dirty) {
			log.Info("Dirty DB");
		} else {
			err = m.Up();
			log.Info("upgrade result:", err);
		}
	}
}
