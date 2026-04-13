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


-- Menghitung biaya parkir berdasarkan jenis kendaraan dan durasi

DELIMITER $$

CREATE FUNCTION hitung_biaya_parkir(
    p_jenis_kendaraan VARCHAR(20),
    p_durasi INT
)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE tarif DECIMAL(10,2);

    SELECT tarif_per_jam
    INTO tarif
    FROM tarif_kendaraan
    WHERE jenis_kendaraan = p_jenis_kendaraan;

    RETURN tarif * p_durasi;
END$$

DELIMITER ;

SELECT 
    t.id_transaksi,
    k.nomor_kendaraan,
    k.jenis_kendaraan,
    hitung_durasi_parkir(t.waktu_masuk, t.waktu_keluar) AS durasi,
    hitung_biaya_parkir(
        k.jenis_kendaraan,
        hitung_durasi_parkir(t.waktu_masuk, t.waktu_keluar)
    ) AS total_biaya
FROM transaksi_parkir t
JOIN kendaraan k ON t.id_kendaraan = k.id_kendaraan;
