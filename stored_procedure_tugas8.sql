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

-- cara menggunakan soal 2
