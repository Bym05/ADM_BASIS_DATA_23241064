-- Nama : Muhammad Bima Yuliyanto
-- NIM  : 23241064
-- Kelas : B
-- Modul : ORDER BY, Fungsi Agregasi, GROUP BY, HAVING

-- Menggunakan Database
USE pti_mart;

-- Praktek 1
-- ORDER BY (Menyusun urutan data berdasarkan nilai sebuah coloumb)
-- Ambil nama produk dan qty dari tabel penjualan urutkan qty
SELECT nama_produk, qty FROM tr_penjualan ORDER BY qty;

-- Praktek 2
-- Ambil nama produk dan qty dari tabel penjualan urutkan qty dan nama produk
SELECT nama_produk, qty FROM tr_penjualan ORDER BY qty, nama_produk;

-- Latihan Mandiri 1
-- 1. Ambil semua kolom dari tabel tr_penjualan.
SELECT * FROM tr_penjualan ORDER BY qty, tgl_transaksi;
-- 2. Mengambil semua kolom dari tabel pelanggan
SELECT * FROM ms_pelanggan ORDER BY nama_pelanggan;
-- 3. Ambil semua kolom dari tabel pelanggan
SELECT * FROM ms_pelanggan ORDER BY alamat;

-- Praktek 3
-- ORDER BY ASC dan desc
-- Ambil nama produk, qty dari tb penjualan urutkan qty dari yang besar ke yang kecil
SELECT nama_produk, qty FROM tr_penjualan ORDER BY qty DESC;

-- Ambil nama produk, qty dari tb penjualan urutkan qty dan nama produk dari besar ke kecil
SELECT nama_produk, qty FROM tr_penjualan ORDER BY qty DESC, nama_produk DESC;

-- Latihan Mandiri 2
-- 1. Mengambil semua kolom dari tabel tr_penjualan
SELECT * FROM tr_penjualan ORDER BY qty DESC, tgl_transaksi DESC;
-- 2. Mengambil semua kolom dari tabel pelanggan
SELECT * FROM ms_pelanggan ORDER BY nama_pelanggan DESC;
-- 3. Mengambil semua kolom dari tabel tr_penjualan
SELECT * FROM ms_pelanggan ORDER BY alamat DESC;

-- Praktek 4
-- Order by hasil dari perhitungan
-- Ambil nama produk, qty, harga, harga*qty, dari tb penjualan urutkan hasil dari harga*qty besar-kecil
SELECT nama_produk, harga, qty, harga*qty AS total
FROM tr_penjualan
ORDER BY total DESC;

-- Latihan Mandiri 3
-- Cobalah Pengurutan dengan ekspresi total harga menggunakan rumusan jumlah barang dikali harga barang dikurangi diskon
SELECT nama_produk, qty, harga, diskon_persen, qty*harga AS total_harga,
((qty*harga)) - ((diskon_persen/100)*harga) AS total_bayar
FROM tr_penjualan
WHERE diskon_persen > 0
ORDER BY diskon_persen DESC, total_bayar DESC;

-- Praktek 6
-- ORDER BY menggunakan WHERE
-- Ambil nama produk, qty, dari tb penjualan yang nama produk berawalan huruf 'f' urut qty
SELECT nama_produk, qty
FROM tr_penjualan
WHERE nama_produk LIKE 'f%'
ORDER BY qty DESC; 

-- Tambahan dari Latihan Mandiri:
-- 1. Tampilkan semua kolom dari transaksi penjualan yang memiliki diskon dan diurutkan berdasarkan harga tertinggi
SELECT *
FROM tr_penjualan
WHERE diskon_persen IS NOT NULL
ORDER BY harga DESC;

-- 2. Tampilkan kolom nama produk, kuantitas pembelian dan harga dari transaksi penjualan 
--    yang memiliki harga minimal seratus ribu rupiah dan diurutkan berdasarkan harga tertinggi
SELECT nama_produk, qty AS kuantitas_pembelian, harga
FROM tr_penjualan
WHERE harga >= 100000
ORDER BY harga DESC;

-- 3. Tampilkan kolom nama produk, kuantitas pembelian dan harga dari transaksi penjualan 
--    yang memiliki harga minimal seratus ribu rupiah atau nama produk berawalan karakter 'T'
--    dan diurutkan berdasarkan diskon tertinggi
SELECT nama_produk, qty AS kuantitas_pembelian, harga
FROM tr_penjualan
WHERE harga >= 100000 OR nama_produk LIKE 'T%'
ORDER BY diskon_persen DESC;

-- Cek data pelanggan
SELECT * FROM ms_pelanggan;

-- FUNGSI AGREGASI
-- di gunakan untuk mengolah beberapa baris/ raw data untuk menghasilkan nilai baru

-- praktek 7
-- Hitung atau jumlahkan seluruh nilai dari baris qty pada tabel penjualan
SELECT qty FROM tr_penjualan;
SELECT SUM(qty) FROM tr_penjualan;

-- Praktek 8
-- Hitung seluruh baris pada tabel penjualan
SELECT * FROM tr_penjualan;
SELECT COUNT(*) FROM tr_penjualan;

-- Praktek 9
-- Menggunakan 2 fungsi agregasi dalam satu query SQL
SELECT SUM(qty), COUNT(*) FROM tr_penjualan;

-- Praktek 10
-- Hitung rata-rata penjualan, penjualan tertinggi transaksi, dan penjualan terendah pertransaksi
SELECT AVG(qty), MAX(qty), MIN(qty)
FROM tr_penjualan;