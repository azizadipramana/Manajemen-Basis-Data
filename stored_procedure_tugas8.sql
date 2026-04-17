-- stored procedure soal 1
DELIMITER $$

CREATE PROCEDURE input_kendaraan_masuk (
    IN p_id_transaksi INT,
    IN p_waktu_masuk DATETIME,
    IN p_id_kendaraan INT,
    IN p_id_petugas INT,
    IN p_id_zona INT
)
BEGIN
    INSERT INTO transaksi_parkir (
        id_transaksi,
        waktu_masuk,
        waktu_keluar,
        id_kendaraan,
        id_petugas,
        id_zona
    )
    VALUES (
        p_id_transaksi,
        p_waktu_masuk,
        NULL,
        p_id_kendaraan,
        p_id_petugas,
        p_id_zona
    );
END$$

DELIMITER ;


-- cara menggunakan soal 1
CALL input_kendaraan_masuk(
    21,
    '2026-04-17 08:00:00',
    1,
    1,
    1
);

-- stored procedure soal 2
DELIMITER $$

CREATE PROCEDURE laporan_zona_parkir()
BEGIN
    SELECT 
        z.nama_zona,
        z.kapasitas,
        COUNT(t.id_transaksi) AS jumlah_kendaraan_parkir,
        (z.kapasitas - COUNT(t.id_transaksi)) AS sisa_kapasitas
    FROM zona_parkir z
    LEFT JOIN transaksi_parkir t 
        ON z.id_zona = t.id_zona
        AND t.waktu_keluar IS NULL
    GROUP BY z.id_zona, z.nama_zona, z.kapasitas;
END$$

DELIMITER ;


-- cara menggunakan soal 2
CALL laporan_zona_parkir();
