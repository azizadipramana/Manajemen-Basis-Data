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
    waktu_keluar DATETIME NULL,
    id_kendaraan INT NOT NULL,
    id_petugas INT NOT NULL,
    id_zona INT NOT NULL,
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

INSERT INTO pengguna (id_pengguna, no_identitas, nama, status) VALUES
(1, 1001, 'Andi Saputra', 'Mhs'),
(2, 1002, 'Budi Santoso', 'Mhs'),
(3, 1003, 'Citra Lestari', 'Dosen'),
(4, 1004, 'Dewi Anggraini', 'Mhs'),
(5, 1005, 'Eko Prasetyo', 'Staf'),
(6, 1006, 'Fajar Ramadhan', 'Mhs'),
(7, 1007, 'Gina Maharani', 'Mhs'),
(8, 1008, 'Hadi Wijaya', 'Dosen'),
(9, 1009, 'Indah Permata', 'Mhs'),
(10, 1010, 'Joko Susilo', 'Staf'),
(11, 1011, 'Kartika Sari', 'Mhs'),
(12, 1012, 'Lukman Hakim', 'Mhs'),
(13, 1013, 'Maya Putri', 'Dosen'),
(14, 1014, 'Nanda Pratama', 'Mhs'),
(15, 1015, 'Oki Firmansyah', 'Mhs'),
(16, 1016, 'Putri Amelia', 'Staf'),
(17, 1017, 'Qori Aisyah', 'Mhs'),
(18, 1018, 'Rizky Maulana', 'Mhs'),
(19, 1019, 'Salsa Bintari', 'Dosen'),
(20, 1020, 'Taufik Hidayat', 'Mhs');

INSERT INTO petugas (id_petugas, nama_petugas) VALUES
(1, 'Agus Salim'),
(2, 'Bayu Pramana'),
(3, 'Cahyo Nugroho'),
(4, 'Dedi Kurniawan'),
(5, 'Evan Setiawan'),
(6, 'Fikri Hidayat'),
(7, 'Galih Saputra'),
(8, 'Hendra Wijaya'),
(9, 'Ilham Maulana'),
(10, 'Jefri Saputro'),
(11, 'Kurnia Abadi'),
(12, 'Lutfi Ramadhan'),
(13, 'M. Ridwan'),
(14, 'Naufal Akbar'),
(15, 'Oman Siregar'),
(16, 'Pandu Prakoso'),
(17, 'Qomaruddin'),
(18, 'Rian Firmansyah'),
(19, 'Surya Nugraha'),
(20, 'Teguh Pratama');

INSERT INTO zona_parkir (id_zona, nama_zona, kapasitas, tarif_per_jam) VALUES
(1, 'Zona A', 50, 2000.00),
(2, 'Zona B', 40, 2000.00),
(3, 'Zona C', 35, 3000.00),
(4, 'Zona D', 45, 3000.00),
(5, 'Zona E', 60, 2000.00),
(6, 'Zona F', 30, 3000.00),
(7, 'Zona G', 55, 2000.00),
(8, 'Zona H', 25, 3000.00),
(9, 'Zona I', 70, 2000.00),
(10, 'Zona J', 65, 3000.00),
(11, 'Zona K', 50, 2000.00),
(12, 'Zona L', 40, 3000.00),
(13, 'Zona M', 35, 2000.00),
(14, 'Zona N', 45, 3000.00),
(15, 'Zona O', 60, 2000.00),
(16, 'Zona P', 30, 3000.00),
(17, 'Zona Q', 55, 2000.00),
(18, 'Zona R', 25, 3000.00),
(19, 'Zona S', 70, 2000.00),
(20, 'Zona T', 65, 3000.00);

INSERT INTO kendaraan (id_kendaraan, nomor_kendaraan, jenis_kendaraan, id_pengguna) VALUES
(1, 'BK1001AA', 'Motor', 1),
(2, 'BK1002AB', 'Mobil', 2),
(3, 'BK1003AC', 'Motor', 3),
(4, 'BK1004AD', 'Mobil', 4),
(5, 'BK1005AE', 'Motor', 5),
(6, 'BK1006AF', 'Motor', 6),
(7, 'BK1007AG', 'Mobil', 7),
(8, 'BK1008AH', 'Motor', 8),
(9, 'BK1009AI', 'Mobil', 9),
(10, 'BK1010AJ', 'Motor', 10),
(11, 'BK1011AK', 'Motor', 11),
(12, 'BK1012AL', 'Mobil', 12),
(13, 'BK1013AM', 'Motor', 13),
(14, 'BK1014AN', 'Mobil', 14),
(15, 'BK1015AO', 'Motor', 15),
(16, 'BK1016AP', 'Motor', 16),
(17, 'BK1017AQ', 'Mobil', 17),
(18, 'BK1018AR', 'Motor', 18),
(19, 'BK1019AS', 'Mobil', 19),
(20, 'BK1020AT', 'Motor', 20);


-- insert transaksi parkir menggunakan stored procedure pada file stored_procedure_tugas8.sql di repo ini


INSERT INTO izin_zona_kendaraan (id_izin, jenis_kendaraan, id_zona) VALUES
(1, 'Motor', 1),
(2, 'Mobil', 2),
(3, 'Motor', 3),
(4, 'Mobil', 4),
(5, 'Motor', 5),
(6, 'Mobil', 6),
(7, 'Motor', 7),
(8, 'Mobil', 8),
(9, 'Motor', 9),
(10, 'Mobil', 10),
(11, 'Motor', 11),
(12, 'Mobil', 12),
(13, 'Motor', 13),
(14, 'Mobil', 14),
(15, 'Motor', 15),
(16, 'Mobil', 16),
(17, 'Motor', 17),
(18, 'Mobil', 18),
(19, 'Motor', 19),
(20, 'Mobil', 20);

INSERT INTO tarif_kendaraan (jenis_kendaraan, tarif_per_jam) VALUES
('Motor', 2000),
('Mobil', 5000);
