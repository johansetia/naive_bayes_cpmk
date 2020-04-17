package main

import (
	"fmt"
	"os"

	"github.com/johansetia/naive_bayes_cpmk/predictor"

	"github.com/johansetia/naive_bayes_cpmk/boot"
	"github.com/labstack/echo/v4"
)

func init() {
	boot.Init()
}

func main() {
	hostIP := os.Getenv("HOST_IP")
	hostPort := os.Getenv("HOST_PORT")
	hostEdp := os.Getenv("HOST_ENDPOINT")

	if (hostEdp == "") || (hostIP == "") || (hostPort == "") {
		fmt.Println("HOST variable cannot be empty")
		os.Exit(1)
	}
	e := echo.New()
	e.Any("/"+hostEdp, predictor.NaiveBayes)
	e.HideBanner = true
	e.Start(hostIP + ":" + hostPort)
}
