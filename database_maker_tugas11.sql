CREATE DATABASE db_parkir_kampus;
USE db_parkir_kampus;

CREATE TABLE pengguna (
    id_pengguna INT PRIMARY KEY,
    no_identitas INT NOT NULL UNIQUE,
    nama VARCHAR(250) NOT NULL,
    status VARCHAR(10) NOT NULL
);

CREATE TABLE petugas (
    id_petugas INT PRIMARY KEY,
    nama_petugas VARCHAR(250) NOT NULL
);

CREATE TABLE zona_parkir (
    id_zona INT PRIMARY KEY,
    nama_zona VARCHAR(250) NOT NULL,
    kapasitas INT NOT NULL,
    tarif_per_jam DECIMAL(10,2) NOT NULL
);

CREATE TABLE kendaraan (
    id_kendaraan INT PRIMARY KEY,
    nomor_kendaraan VARCHAR(20) NOT NULL UNIQUE,
    jenis_kendaraan VARCHAR(10) NOT NULL,
    id_pengguna INT NOT NULL,
    CONSTRAINT fk_kendaraan_pengguna
        FOREIGN KEY (id_pengguna) REFERENCES pengguna(id_pengguna)
);

CREATE TABLE transaksi_parkir (
    id_transaksi INT PRIMARY KEY,
    waktu_masuk DATETIME NOT NULL,
    waktu_keluar DATETIME NOT NULL,
    id_kendaraan INT NOT NULL,
    id_petugas INT NOT NULL,
    id_zona INT NOT NULL,
    total_bayar DECIMAL(10,2) NOT NULL, 
    CONSTRAINT fk_transaksi_kendaraan
        FOREIGN KEY (id_kendaraan) REFERENCES kendaraan(id_kendaraan),
    CONSTRAINT fk_transaksi_petugas
        FOREIGN KEY (id_petugas) REFERENCES petugas(id_petugas),
    CONSTRAINT fk_transaksi_zona
        FOREIGN KEY (id_zona) REFERENCES zona_parkir(id_zona)
);

CREATE TABLE izin_zona_kendaraan (
    id_izin INT PRIMARY KEY,
    jenis_kendaraan VARCHAR(20) NOT NULL,
    id_zona INT NOT NULL,
    CONSTRAINT fk_izin_zona
        FOREIGN KEY (id_zona) REFERENCES zona_parkir(id_zona)
);

CREATE TABLE tarif_kendaraan (
    jenis_kendaraan VARCHAR(20) PRIMARY KEY,
    tarif_per_jam DECIMAL(10,2) NOT NULL
);


-- untuk bukti saja
UPDATE zona_parkir
SET kapasitas = 1
WHERE id_zona = 1;


INSERT INTO izin_zona_kendaraan (id_izin, jenis_kendaraan, id_zona) VALUES
(1, 'Motor', 1),
(2, 'Mobil', 2),
(3, 'Motor', 3),
(4, 'Mobil', 4),
(5, 'Motor', 5);
