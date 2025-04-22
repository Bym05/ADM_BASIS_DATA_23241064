-- Nama		: Muhammad Bima Yuliyanto
-- NIM		: 23241064
-- Kelas	: B
-- Modul	: 2 (SELECT)

-- Membuat database
CREATE DATABASE pti_mart;
-- Menggunakan database
USE pti_mart;

-- Cek kolom dalam setiap tabel
DESCRIBE ms_pelanggan;
DESCRIBE ms_produk;
DESCRIBE tr_penjualan;

-- SELECT (perintah kepada database untuk mengambil data)
-- Menggunakan SELECT untuk 1 tabel
-- Mengambil kolom nama produk dari tabel produk
SELECT nama_produk FROM ms_produk;

-- Mengambil lebih dari satu kolom dari sebuah tabel
SELECT nama_produk, harga FROM ms_produk;

-- Mengambil seluruh kolom dari sebuah tabel
SELECT * FROM ms_produk;

-- Latihan
-- 1. Mengambil kode produk dan nama produk dari tabel produk
SELECT kode_produk, nama_produk FROM ms_produk;

-- 2. Mengambil seluruh kolom dari tabel penjualan
SELECT * FROM tr_penjualan;

-- Prefix dan Alias
-- Prefix bagian nama objek database yang hirarki nya yang lebih tinggi dari objek tersebut
-- Menggunakan prefix nama tabel untuk kolom nama_produk dari tabel produk
SELECT ms_produk.nama_produk FROM ms_produk;

-- Menggunakan nama database dan tabel sabagai prefix untuk kolom nama_produk
SELECT pti_mart.ms_produk.nama_produk FROM ms_produk;

-- ALIAS, nama sementara pengganti nama objek asli dari database
-- Mengganti sementara kolom nama_produk dengan ALIAS
SELECT nama_produk AS np FROM ms_produk;
SELECT nama_produk np FROM ms_produk;

-- Mengganti Sementara Tabel Dengan Alias
SELECT nama_produk From ms_produk AS msp;

-- Kombinasikan antara PREFIX dan ALIAS
SELECT msp.nama_produk FROM ms_produk AS msp;

-- CASE 1
SELECT nama_pelanggan, alamat FROM ms_pelanggan;
-- CASE 2
SELECT nama_produk, harga FROM ms_produk;