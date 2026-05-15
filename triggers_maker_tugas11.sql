-- Trigger 1: Cek Izin Zona Parkir

DELIMITER $$

CREATE TRIGGER cek_izin_zona
BEFORE INSERT ON transaksi_parkir
FOR EACH ROW
BEGIN
    DECLARE v_jenis_kendaraan VARCHAR(20);
    DECLARE jumlah_izin INT;

    -- Ambil jenis kendaraan
    SELECT jenis_kendaraan
    INTO v_jenis_kendaraan
    FROM kendaraan
    WHERE id_kendaraan = NEW.id_kendaraan;

    -- Cek apakah kendaraan boleh masuk zona
    SELECT COUNT(*)
    INTO jumlah_izin
    FROM izin_zona_kendaraan
    WHERE jenis_kendaraan = v_jenis_kendaraan
    AND id_zona = NEW.id_zona;

    -- Jika tidak boleh
    IF jumlah_izin = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Jenis kendaraan tidak diizinkan di zona ini';
    END IF;
END$$

DELIMITER ;


-- Trigger 2: Validasi waktu keluar harus lebih besar dari waktu masuk
DELIMITER $$

CREATE TRIGGER validasi_waktu_parkir
BEFORE INSERT ON transaksi_parkir
FOR EACH ROW
BEGIN
    IF NEW.waktu_keluar <= NEW.waktu_masuk THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Waktu keluar harus lebih besar dari waktu masuk';
    END IF;
END$$

DELIMITER ;


-- Trigger 3: cek kapasitas zona parkir

DELIMITER $$

CREATE TRIGGER cek_kapasitas_zona
BEFORE INSERT ON transaksi_parkir
FOR EACH ROW
BEGIN
    DECLARE jumlah_parkir INT;
    DECLARE kapasitas_zona INT;

    -- Hitung jumlah kendaraan di zona
    SELECT COUNT(*)
    INTO jumlah_parkir
    FROM transaksi_parkir
    WHERE id_zona = NEW.id_zona;

    -- Ambil kapasitas zona
    SELECT kapasitas
    INTO kapasitas_zona
    FROM zona_parkir
    WHERE id_zona = NEW.id_zona;

    -- Validasi kapasitas
    IF jumlah_parkir >= kapasitas_zona THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Zona parkir penuh';
    END IF;
END$$

DELIMITER ;


-- Trigger 4: otomatis menghitung tarif parkir

DELIMITER $$

CREATE TRIGGER hitung_total_bayar
BEFORE INSERT ON transaksi_parkir
FOR EACH ROW
BEGIN
    DECLARE v_tarif DECIMAL(10,2);
    DECLARE v_jenis VARCHAR(20);
    DECLARE v_durasi INT;

    -- Ambil jenis kendaraan
    SELECT jenis_kendaraan
    INTO v_jenis
    FROM kendaraan
    WHERE id_kendaraan = NEW.id_kendaraan;

    -- Ambil tarif kendaraan
    SELECT tarif_per_jam
    INTO v_tarif
    FROM tarif_kendaraan
    WHERE jenis_kendaraan = v_jenis;

    -- Hitung durasi (dibulatkan ke atas)
    SET v_durasi = CEIL(
        TIMESTAMPDIFF(MINUTE, NEW.waktu_masuk, NEW.waktu_keluar) / 60
    );

    -- Hitung total bayar
    SET NEW.total_bayar = v_tarif * v_durasi;
END$$

DELIMITER ;
