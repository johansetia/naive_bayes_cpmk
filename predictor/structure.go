package predictor

import (
	v "github.com/go-ozzo/ozzo-validation/v4"

	"github.com/jinzhu/gorm"
)

var (
	// ClassTepat is
	ClassTepat = "TEPAT"
	// ClassTerlambat is
	ClassTerlambat = "TERLAMBAT"
)

type (
	// Mahasiswa is
	Mahasiswa struct {
		Jk        string `json:"jenis_kelamin" gorm:"column:jenis_kelamin"`
		SttsMhs   string `json:"status_mahasiswa" gorm:"column:status_mhs"`
		SttsNikah string `json:"status_pernikahan" gorm:"column:pernikahan"`
		IPK       string `json:"grade_ipk" gorm:"column:ipk_grade"`
	}

	// Counter is count
	Counter struct {
		db                *gorm.DB
		Count             int `gorm:"column:count"`
		Class, Value, Col string
		Table             string
	}

	// PredValue is
	PredValue struct {
		Count     int `json:"count"`
		Jk        int `json:"jenis_kelamin"`
		SttsMhs   int `json:"status_mahasiswa"`
		SttsNikah int `json:"status_pernikahan"`
		IPK       int `json:"grade_ipk"`
	}

	// CalcValue is
	CalcValue struct {
		Result    float64 `json:"prob_result"`
		Jk        float64 `json:"prob_jenis_kelamin"`
		SttsMhs   float64 `json:"prob_status_mahasiswa"`
		SttsNikah float64 `json:"prob_status_pernikahan"`
		IPK       float64 `json:"prob_grade_ipk"`
	}
	// Prediction is
	Prediction struct {
		Msg    string    `json:"message"`
		Result string    `json:"result"`
		Req    Mahasiswa `json:"requested_data"`
		Total  int       `json:"total_data"`
		Prob   struct {
			Tepat     PredValue `json:"class_tepat"`
			Terlambat PredValue `json:"class_terlambat"`
		} `json:"probability"`
		Calc struct {
			Tepat     CalcValue `json:"prob_tepat"`
			Terlambat CalcValue `json:"prob_terlambat"`
		} `json:"calculation"`
	}
)

// TableName is
func (Mahasiswa) TableName() string {
	return "mahasiswa"
}

// Validate mahasiswa
func (m Mahasiswa) Validate() error {
	return v.ValidateStruct(&m,
		v.Field(&m.Jk, v.Required, v.In("L", "P")),
		v.Field(&m.SttsMhs, v.Required, v.In("KERJA", "MHS")),
		v.Field(&m.SttsNikah, v.Required, v.In("SUDAH", "BELUM")),
		v.Field(&m.IPK, v.Required, v.In("A", "B", "C", "D", "E", "F", "G", "H", "I", "J")),
	)
}
