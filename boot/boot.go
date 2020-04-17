package boot

import (
	"fmt"
	"os"

	"github.com/johansetia/naive_bayes_cpmk/db"

	"github.com/joho/godotenv"
)

// Init is
func Init() {
	err := godotenv.Load(".env")
	if err != nil {
		fmt.Println("ERROR GET .env")
	}

	user := os.Getenv("DB_USERNAME")
	port := os.Getenv("DB_PORT")
	addr := os.Getenv("DB_HOST")
	pswd := os.Getenv("DB_PASSWORD")
	dbname := os.Getenv("DB_NAME")

	// assigning a connection databases variable with db env structure
	db.ConParam = user + ":" + pswd + "@(" + addr + ":" + port + ")/" + dbname

	check, err := db.GetCon()
	if err != nil {
		fmt.Println(err)
		os.Exit(1)
	}
	check.Close()
}
