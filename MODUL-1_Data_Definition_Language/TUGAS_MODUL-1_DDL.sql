-- Hapus database jika sudah ada
DROP DATABASE IF EXISTS tiket_bus;

-- Buat database baru
CREATE DATABASE tiket_bus;
USE tiket_bus;

-- Tabel CUSTOMER
CREATE TABLE CUSTOMER (
    id_customer INT AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR(100),
    alamat TEXT
);

-- Tabel CUSTOMER_TELPON
CREATE TABLE CUSTOMER_TELPON (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_customer INT,
    no_tlp VARCHAR(20),
    FOREIGN KEY (id_customer) REFERENCES CUSTOMER(id_customer)
);

-- Tabel AGEN
CREATE TABLE AGEN (
    nik VARCHAR(20) PRIMARY KEY,
    nama_agen VARCHAR(100),
    alamat TEXT,
    jenis_kelamin ENUM('L', 'P')
);

-- Tabel AGEN_TELPON
CREATE TABLE AGEN_TELPON (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nik VARCHAR(20),
    no_tlp VARCHAR(20),
    FOREIGN KEY (nik) REFERENCES AGEN(nik)
);

-- Tabel BUS
CREATE TABLE BUS (
    id_bus INT AUTO_INCREMENT PRIMARY KEY,
    nama_bus VARCHAR(100),
    tujuan TEXT
);

-- Tabel BUS_DETAIL
CREATE TABLE BUS_DETAIL (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_bus INT,
    no_plat VARCHAR(20),
    warna_bus VARCHAR(50),
    FOREIGN KEY (id_bus) REFERENCES BUS(id_bus)
);

-- Tabel JADWAL
CREATE TABLE JADWAL (
    id_jadwal INT AUTO_INCREMENT PRIMARY KEY,
    id_bus INT,
    jam TIME,
    hari VARCHAR(10),
    tanggal DATE,
    FOREIGN KEY (id_bus) REFERENCES BUS(id_bus)
);

-- Tabel KELAS
CREATE TABLE KELAS (
    id_kelas INT AUTO_INCREMENT PRIMARY KEY,
    nama_kelas ENUM('EXECUTIVE', 'NON EXECUTIVE'),
    harga INT
);

-- Tabel FASILITAS
CREATE TABLE FASILITAS (
    id_fasilitas INT AUTO_INCREMENT PRIMARY KEY,
    nama_kelas ENUM('EXECUTIVE', 'NON EXECUTIVE'),
    fasilitas TEXT
);

-- Tabel TIKET (transaksi/pemesanan)
CREATE TABLE TIKET (
    id_tiket INT AUTO_INCREMENT PRIMARY KEY,
    id_customer INT,
    id_jadwal INT,
    id_kelas INT,
    FOREIGN KEY (id_customer) REFERENCES CUSTOMER(id_customer),
    FOREIGN KEY (id_jadwal) REFERENCES JADWAL(id_jadwal),
    FOREIGN KEY (id_kelas) REFERENCES KELAS(id_kelas)
);

-- ===============================
-- INSERT DATA
-- ===============================

-- Data CUSTOMER
INSERT INTO CUSTOMER (nama, alamat) VALUES ('Sulfan', 'Jl. Merdeka No.1');
INSERT INTO CUSTOMER_TELPON (id_customer, no_tlp) VALUES (1, '08123456789');

-- Data AGEN
INSERT INTO AGEN (nik, nama_agen, alamat, jenis_kelamin) VALUES 
('1234567890', 'Chelly', 'Jl. Mawar', 'P'),
('2233445566', 'Martiano', 'Jl. Melati', 'L'),
('9988776655', 'Ridho', 'Jl. Kenanga', 'L');

INSERT INTO AGEN_TELPON (nik, no_tlp) VALUES 
('1234567890', '08765421333'),
('2233445566', '0213456'),
('9988776655', '089764353');

-- Data BUS
INSERT INTO BUS (nama_bus, tujuan) VALUES ('PT.SinarNTBTransport', 'Lombok - Mataram');
INSERT INTO BUS_DETAIL (id_bus, no_plat, warna_bus) VALUES (1, 'DR1234AB', 'Biru');

-- Data JADWAL
INSERT INTO JADWAL (id_bus, jam, hari, tanggal) VALUES (1, '08:00:00', 'Senin', '2025-05-01');

-- Data KELAS
INSERT INTO KELAS (nama_kelas, harga) VALUES 
('EXECUTIVE', 250000), 
('NON EXECUTIVE', 200000);

-- Data FASILITAS
INSERT INTO FASILITAS (nama_kelas, fasilitas) VALUES 
('EXECUTIVE', 'Snack, SuiteSeat, Selimut, Bantal, & Service Makan'),
('NON EXECUTIVE', 'Kursi biasa & Service Makan');

-- Data TIKET
INSERT INTO TIKET (id_customer, id_jadwal, id_kelas) VALUES (1, 1, 1);

-- ===============================
-- SELECT JOIN (Tampil Data Tiket)
-- ===============================

SELECT * FROM tiket_bus.agen;
SELECT * FROM tiket_bus.agen_telpon;
SELECT * FROM tiket_bus.bus;
SELECT * FROM tiket_bus.bus_detail;
SELECT * FROM tiket_bus.customer;
SELECT * FROM tiket_bus.fasilitas;
SELECT * FROM tiket_bus.kelas;
SELECT * FROM tiket_bus.tiket;

