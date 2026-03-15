-- Query 1
SELECT k.nomor_kendaraan
FROM transaksi_parkir tp
JOIN kendaraan k ON tp.id_kendaraan = k.id_kendaraan
WHERE tp.waktu_keluar IS NULL;

-- Query 2
SELECT tp.id_transaksi, tp.waktu_masuk, tp.waktu_keluar, zp.nama_zona
FROM transaksi_parkir tp
JOIN zona_parkir zp ON tp.id_zona = zp.id_zona;

-- Query 3
SELECT DISTINCT p.nama_petugas
FROM petugas p
JOIN transaksi_parkir tp ON p.id_petugas = tp.id_petugas;

-- Query 4
SELECT pg.nama, k.nomor_kendaraan
FROM pengguna pg
JOIN kendaraan k ON pg.id_pengguna = k.id_pengguna;

-- Query 5
SELECT tp.id_transaksi, tp.waktu_masuk, tp.waktu_keluar
FROM transaksi_parkir tp
JOIN zona_parkir zp ON tp.id_zona = zp.id_zona
WHERE zp.nama_zona = 'Zona A';

-- Query 6
SELECT *
FROM zona_parkir
WHERE tarif_per_jam > 3000;
