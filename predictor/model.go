package predictor

import (
	"runtime"
	"sync"

	"github.com/johansetia/naive_bayes_cpmk/db"
)

// Classify is
func (m *Mahasiswa) Classify() (*Prediction, error) {
	p := new(Prediction)
	c := new(Counter)
	c.Table = m.TableName()

	p.Req = *m
	db, err := db.GetCon()
	if err != nil {
		return nil, err
	}
	defer db.Close()
	c.db = db
	p.Total = c.CountAll()

	// tepat
	c.Class = ClassTepat
	p.Prob.Tepat.Count = c.Counter()

	c.Col, c.Value = "jenis_kelamin", m.Jk
	p.Prob.Tepat.Jk = c.Counter()
	c.Col, c.Value = "status_mhs", m.SttsMhs
	p.Prob.Tepat.SttsMhs = c.Counter()
	c.Col, c.Value = "pernikahan", m.SttsNikah
	p.Prob.Tepat.SttsNikah = c.Counter()
	c.Col, c.Value = "ipk_grade", m.IPK
	p.Prob.Tepat.IPK = c.Counter()

	// terlambat
	c.Class = ClassTerlambat
	p.Prob.Terlambat.Count = c.Counter()

	c.Col, c.Value = "jenis_kelamin", m.Jk
	p.Prob.Terlambat.Jk = c.Counter()
	c.Col, c.Value = "status_mhs", m.SttsMhs
	p.Prob.Terlambat.SttsMhs = c.Counter()
	c.Col, c.Value = "pernikahan", m.SttsNikah
	p.Prob.Terlambat.SttsNikah = c.Counter()
	c.Col, c.Value = "ipk_grade", m.IPK
	p.Prob.Terlambat.IPK = c.Counter()

	p.Calculate()

	return p, nil
}

// Calculate is
func (p *Prediction) Calculate() {
	runtime.GOMAXPROCS(6)
	var wg sync.WaitGroup
	wg.Add(2)

	// hitung tepat
	tepatCount := float64(p.Prob.Tepat.Count)
	go func() {
		p.Calc.Tepat.Jk = float64(p.Prob.Tepat.Jk) / tepatCount
		p.Calc.Tepat.SttsMhs = float64(p.Prob.Tepat.SttsMhs) / tepatCount
		p.Calc.Tepat.SttsNikah = float64(p.Prob.Tepat.SttsNikah) / tepatCount
		p.Calc.Tepat.IPK = float64(p.Prob.Tepat.IPK) / tepatCount
		wg.Done()
	}()

	// hitung terlambat
	terlambatCount := float64(p.Prob.Terlambat.Count)
	go func() {
		p.Calc.Terlambat.Jk = float64(p.Prob.Terlambat.Jk) / terlambatCount
		p.Calc.Terlambat.SttsMhs = float64(p.Prob.Terlambat.SttsMhs) / terlambatCount
		p.Calc.Terlambat.SttsNikah = float64(p.Prob.Terlambat.SttsNikah) / terlambatCount
		p.Calc.Terlambat.IPK = float64(p.Prob.Terlambat.IPK) / terlambatCount
		wg.Done()
	}()
	wg.Wait()
	wg.Add(2)

	// kalikan tepat
	go func() {
		probTepat := tepatCount / float64(p.Total)
		p.Calc.Tepat.Result = p.Calc.Tepat.Jk *
			p.Calc.Tepat.SttsMhs *
			p.Calc.Tepat.SttsNikah *
			p.Calc.Tepat.IPK *
			probTepat
		wg.Done()
	}()

	// kalikan terlambat
	go func() {
		probTerlambat := terlambatCount / float64(p.Total)
		p.Calc.Terlambat.Result = p.Calc.Terlambat.Jk *
			p.Calc.Terlambat.SttsMhs *
			p.Calc.Terlambat.SttsNikah *
			p.Calc.Terlambat.IPK *
			probTerlambat
		wg.Done()
	}()
	wg.Wait()

	if p.Calc.Tepat.Result > p.Calc.Terlambat.Result {
		p.Result = ClassTepat
	} else {
		p.Result = ClassTerlambat
	}

	p.Msg = "Berdasarkan dari data requested_data, mahasiswa tersebut masuk dalam klasifikasi " + p.Result
}

// Counter is
func (c *Counter) Counter() int {
	if (c.Value != "") && (c.Col != "") {
		c.db.Table(c.Table).
			Select("COUNT(id) as count").
			Where("status_kelulusan = ?", c.Class).
			Where(c.Col+" = ?", c.Value).
			Scan(&c)
		c.Value, c.Col = "", ""
	} else {
		c.db.Table(c.Table).
			Select("COUNT(id) as count").
			Where("status_kelulusan = ?", c.Class).
			Scan(&c)
	}

	return c.Count
}

// CountAll is
func (c *Counter) CountAll() int {
	c.Value, c.Col, c.Class = "", "", ""
	c.db.Table(c.Table).
		Select("COUNT(id) as count").
		Scan(&c)
	return c.Count
}
