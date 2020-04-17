package predictor

import (
	"net/http"

	"github.com/labstack/echo/v4"
)

type (
	// Resp is
	Resp struct {
		Status bool        `json:"status"`
		Error  interface{} `json:"error,omitempty"`
		Data   interface{} `json:"data,omitempty"`
	}
)

// NaiveBayes controller
func NaiveBayes(c echo.Context) error {
	var err error
	if c.Request().Method != "POST" {
		return c.String(http.StatusOK, "You must access this URL using POST with JSON Body")
	}
	r := new(Resp)

	mhs := new(Mahasiswa)
	c.Bind(mhs)
	r.Error = mhs.Validate()
	if r.Error != nil {
		r.Status = false
		return c.JSON(http.StatusNotFound, r)
	}

	r.Data, err = mhs.Classify()
	if err != nil {
		r.Status = false
		return c.JSON(http.StatusNotFound, r)
	}
	r.Status = true
	return c.JSON(http.StatusOK, r)
}
