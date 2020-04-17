package db

import (
	"errors"

	// _ gorm
	_ "github.com/go-sql-driver/mysql"
	"github.com/jinzhu/gorm"
)

// ConParam is
var ConParam string

// GetCon is
func GetCon() (*gorm.DB, error) {
	db, err := gorm.Open("mysql", ConParam)
	if err == nil {
		return db, nil
	}
	return nil, errors.New("can't connect to database")
}
