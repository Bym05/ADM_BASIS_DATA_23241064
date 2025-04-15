-- Nama : Muhammad Bima Yuliyanto
-- NIM : 23241064
-- Kelas : B

-- membuat database
CREATE DATABASE mandalika_mart;

-- menggunakan database mandalika_mart
USE mandalika_mart;

-- membuat tabel dalam database 'mandalika_mart'
CREATE TABLE member (
	member_id varchar(10),
	username varchar(20),
	nama varchar(100),
	tanggal_lahir datetime,
	angka_favorit int);
    
    -- buat tabel produk
CREATE TABLE produk (
    id_produk varchar(10),
    nama_produk varchar(25),
    kategori varchar(15),
    harga int,
    qty int);
    
    -- buat tabel transaksipenjualan
CREATE TABLE transaksi_penjualan (
	tgl_jual datetime,
	id_produk varchar(10),
	member_id varchar(10),
	nama_produk varchar(25),
	harga int,
	qty int);
    
    -- mengupdate primary key tabel member, produk
    ALTER TABLE member
    ADD PRIMARY KEY (member_id);
    
    ALTER TABLE produk
    ADD PRIMARY KEY (id_produk);
    
    -- mengupdate foreign key tabel transaksi_penjualan
    ALTER TABLE transaksi_penjualan
    ADD CONSTRAINT FK_memberTransaksi
    FOREIGN KEY (member_id) REFERENCES member(member_id);
    
    ALTER TABLE transaksi_penjualan
    ADD CONSTRAINT FK_produkTransaksi
    FOREIGN KEY (id_produk) REFERENCES produk(id_produk);
    
    -- mengisi data pada tabel
    INSERT INTO member(member_id, username, nama, tanggal_lahir, angka_favorit)
    VALUES ('BM-05', 'webmaster', 'Admin', '2000-07-05', 5);
    
    -- mengakses isi data pada tabel member
    SELECT * FROM member;