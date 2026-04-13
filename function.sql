-- function menghitung durasi parkir 
DELIMITER $$

CREATE FUNCTION hitung_durasi_parkir(
    waktu_masuk DATETIME,
    waktu_keluar DATETIME
)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE durasi INT;

    SET durasi = CEILING(TIMESTAMPDIFF(MINUTE, waktu_masuk, waktu_keluar) / 60);

    IF durasi < 1 THEN
        SET durasi = 1;
    END IF;

    RETURN durasi;
END$$

DELIMITER ;

SELECT 
    id_transaksi,
    waktu_masuk,
    waktu_keluar,
    hitung_durasi_parkir(waktu_masuk, waktu_keluar) AS durasi_jam
FROM transaksi_parkir;



DELIMITER $$
