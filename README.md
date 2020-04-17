# NAIVE BAYES CPMK

Tugas ini ditujukan untuk memenuhi mata kuliah Kecerdasan Buatan yang  
diampu oleh bu Dr. Shofwatul 'Uyun, S.T., M.Kom. , kode program ini ditulis dalam   
bahasa golang, disini saya tidak menggunakan library / package learning yang ada, sehingga  
saya hanya nenerjemahkan rumus naive bayes kedalam program ini.  
berikut saya lampirkan biodata saya.

Nama : Johan Setiawan  
Nim : 19206050010  
Prodi : S2-Informatika

# CARA MENGGUNAKAN

## Clone Project
lakukan download project / clone 

```bash
    git clone git@github.com:johansetia/naive_bayes_cpmk.git
```

## Update
lakukan update kebutuhan project. sebelumnya, masuk kedalam direktori project
```bash
    go get
```

## Import Database
lakukan import database terlebih dahulu dikarenakan dalam database sudah terisi dataset.

## Atur Konfigurasi Sistem
atur file konfigurasi .env yang ada pada direktory project
```env
    DB_NAME=naive_bayes_CPMK    # diisi dengan nama database
    DB_USERNAME=root            # username database
    DB_PASSWORD=johan           # password database
    DB_HOST=localhost           # host / IP database
    DB_PORT=3306                # port database

    HOST_IP=localhost           # host akan dilakukan serve ke alamat mana
    HOST_PORT=8089              # port yang akan digunakan
    HOST_ENDPOINT=classify      # endpoint yang digunakan
```

## Menjalankan Sistem
apabila data konfigurasi dan seluruh instruksi sebelumnya telah dilakukan dengan benar, maka selanjutnya jalankan sistem menggunakan perintah 
```bash
    go run main.go
```
## Melakukan Request
untuk melakukan klasifikasi, dalam sistem ini menggunakan HTTP Request dengan data  
data URL diambil dari HOST_IP, HOST_PORT, HOST_ENDPOINT

| Method        | URL           | 
| ------------- |:-------------:| 
| POST      | http://localhost:8089/classify |  

dengan Request Body JSON :
```json
    {
        "jenis_kelamin" : "L",
        "status_mahasiswa" : "MHS",
        "status_pernikahan" : "SUDAH",
        "grade_ipk" : "A"
    }
```

apabila semua sudah dilakukan dengan benar, maka akan mendapatkan JSON response :

```json
    {
        "status": true,
        "data": {
            "message": "Berdasarkan dari data requested_data, mahasiswa tersebut masuk dalam klasifikasi TEPAT",
            "result": "TEPAT",
            "requested_data": {
                "jenis_kelamin": "L",
                "status_mahasiswa": "MHS",
                "status_pernikahan": "SUDAH",
                "grade_ipk": "A"
            },
            "total_data": 36,
            "probability": {
                "class_tepat": {
                    "count": 21,
                    "jenis_kelamin": 12,
                    "status_mahasiswa": 12,
                    "status_pernikahan": 8,
                    "grade_ipk": 5
                },
                "class_terlambat": {
                    "count": 15,
                    "jenis_kelamin": 5,
                    "status_mahasiswa": 3,
                    "status_pernikahan": 8,
                    "grade_ipk": 0
                }
            },
            "calculation": {
                "prob_tepat": {
                    "prob_result": 0.01727675197062952,
                    "prob_jenis_kelamin": 0.5714285714285714,
                    "prob_status_mahasiswa": 0.5714285714285714,
                    "prob_status_pernikahan": 0.38095238095238093,
                    "prob_grade_ipk": 0.23809523809523808
                },
                "prob_terlambat": {
                    "prob_result": 0,
                    "prob_jenis_kelamin": 0.3333333333333333,
                    "prob_status_mahasiswa": 0.2,
                    "prob_status_pernikahan": 0.5333333333333333,
                    "prob_grade_ipk": 0
                }
            }
        }
    }
```

## Pohon Direktori
```bash
    ├── boot
    │   └── boot.go
    ├── db
    │   └── db.go
    ├── go.mod
    ├── go.sum
    ├── main.go
    ├── predictor
    │   ├── handler.go
    │   ├── helper.go
    │   ├── model.go
    │   └── structure.go
    ├── README.md
    └── sql
        └── naive_bayes_CPMK_20200417_170352.sql

    4 directories, 11 files
```