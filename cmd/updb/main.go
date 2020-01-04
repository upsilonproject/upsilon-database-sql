package main;

import (
	"fmt"
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


func main() {
	initFlags();
	InitConfig(rootCmd);

	rootCmd.Execute()

	conf := GetConfig();

	mysqlUri := fmt.Sprintf("mysql://%v:%v@tcp(%v)/%v", conf.Database.User, conf.Database.Pass, conf.Database.Host, conf.Database.Name)

	fmt.Printf("conf: %+v \n\n", conf);
	fmt.Printf("db: %v \n\n", mysqlUri)


	m, err := migrate.New(
		"file:///usr/share/upsilon-database-sql/mysql/migrations",
		mysqlUri,
	)

	if err != nil {
		fmt.Println("init errors:", err);
	} else {
		ver, dirty, err := m.Version()

		fmt.Println("version before migration:", ver);

		if (dirty) {
			fmt.Println("Dirty DB");
		} else {
			err = m.Up();
			fmt.Println("upgrade result:", err);
		}
	}
}
