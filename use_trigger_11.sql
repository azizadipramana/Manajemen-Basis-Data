-- use trigger 1: cek_izin_zona

-- contoh berhasil 

INSERT INTO transaksi_parkir (
    id_transaksi,
    waktu_masuk,
    waktu_keluar,
    id_kendaraan,
    id_petugas,
    id_zona,
    total_bayar
)
VALUES (
    21,
    '2026-03-06 08:00:00',
    '2026-03-06 11:00:00',
    2,
    1,
    2,
    15000
);
-- contoh gagal 

INSERT INTO transaksi_parkir (
    id_transaksi,
    waktu_masuk,
    waktu_keluar,
    id_kendaraan,
    id_petugas,
    id_zona, 
    total_bayar
)
VALUES (
    22,
    '2026-03-06 08:00:00',
    '2026-03-06 10:00:00',
    2,
    1,
    1, 
    10000
);


-- use trigger 2: 

-- contoh berhasil 
INSERT INTO transaksi_parkir (
    id_transaksi,
    waktu_masuk,
    waktu_keluar,
    id_kendaraan,
    id_petugas,
    id_zona
)
VALUES (
    23,
    '2026-03-06 08:00:00',
    '2026-03-06 12:00:00',
    1,
    1,
    1
);

-- contoh gagal 

INSERT INTO transaksi_parkir (
    id_transaksi,
    waktu_masuk,
    waktu_keluar,
    id_kendaraan,
    id_petugas,
    id_zona
)
VALUES (
    24,
    '2026-03-06 12:00:00',
    '2026-03-06 10:00:00',
    1,
    1,
    1
);

-- use trigger 3: 

-- update size 
UPDATE zona_parkir
SET kapasitas = 1
WHERE id_zona = 1;

-- contoh berhasil 

INSERT INTO transaksi_parkir VALUES
(
    25,
    '2026-03-06 08:00:00',
    '2026-03-06 10:00:00',
    1,
    1,
    1
);

-- contoh gagal 

INSERT INTO transaksi_parkir VALUES
(
    26,
    '2026-03-06 08:30:00',
    '2026-03-06 11:00:00',
    6,
    2,
    1
);

-- trigger 4: 

INSERT INTO transaksi_parkir (
    id_transaksi,
    waktu_masuk,
    waktu_keluar,
    id_kendaraan,
    id_petugas,
    id_zona
)
VALUES (
    27,
    '2026-03-06 08:00:00',
    '2026-03-06 10:30:00',
    1,
    1,
    1
);

-- cek hasil 

SELECT *
FROM transaksi_parkir
WHERE id_transaksi = 27;
