package config;

import (
	"strings"
	"fmt"
	"github.com/spf13/viper"
	"github.com/spf13/cobra"
)

type RuntimeConfig struct {
	Database DatabaseConfig;
	IsLoaded bool;
	Force int;
}

type DatabaseConfig struct {
	User string;
	Pass string;
	Host string;
	Name string;
}

var (
	conf RuntimeConfig;
)

func InitConfig(rootCmd *cobra.Command) {
	viper.SetEnvPrefix("UP")
	viper.SetEnvKeyReplacer(strings.NewReplacer(".", "_"));
	viper.SetDefault("database.host", "upsilon")
	viper.SetDefault("database.user", "upsilon")
	viper.SetDefault("database.pass", "upsilon")
	viper.SetDefault("database.name", "upsilon")
	viper.AutomaticEnv();

	//viper.BindPFlag("force", rootCmd.Flags().Lookup("force"));

	if !conf.IsLoaded {
		conf.IsLoaded = true;

		if err := viper.Unmarshal(&conf); err != nil {
			fmt.Println("Cannot unmarshal config: ", err)
		}
	}
}

func GetConfig() RuntimeConfig {
	return conf;
}
