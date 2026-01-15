# Project UAS Pemrograman Web
_Nama : Arofah Raudlatul Hasanah_  
_Kelas : TI.24.A2_  
_NIM : 312410231_  

### live demo: [ (https://arofahrh.rf.gd/) ]
### Akun Demo: Admin : (Admin/admin123,) User : (arofah_user/user123)

##  BookBorrow - Sistem Manajemen Perpustakaan  
Aplikasi sederhana yang saya buat yaitu *BookBorrow*, adalah aplikasi berbasis web yang saya buat sebagai alat manajemen untuk pustakawan (Admin) agar mereka dapat dengan mudah mengelola koleksi dan mempercepat proses peminjaman untuk anggota (Pengguna). Fokus utama aplikasi ini adalah kemudahan penggunaan dengan penekanan pada desain dan fungsionalitas. Tema yang saya pilih yaitu  dark wood.

## Screenshoot Aplikasi
### 1. Halaman Login  
<img width="1906" height="910" alt="image" src="https://github.com/user-attachments/assets/24f61927-68de-48c8-ad7d-4ab24e2b6cfe" />

### 2. Katalog Buku (ini khusus user saja)  
<img width="1911" height="909" alt="image" src="https://github.com/user-attachments/assets/b7135df1-0c1f-4e0d-82bc-42f91710c4f8" />

### 3. Dashboard Manajemen (ini khusus admin)  
<img width="1911" height="913" alt="image" src="https://github.com/user-attachments/assets/7d8e231c-808a-49c6-9686-3656d7d8edbf" />

### 4. Riwayat Peminjaman (History nya user)
<img width="1911" height="906" alt="image" src="https://github.com/user-attachments/assets/0d947a0e-1711-4efd-92b1-644e0d18f6eb" />

## Deskripsi Program  
Aplikasi ini dibuat untuk mendigitalisasi perpustakaan konvensional. Fokus utamanya adalah memberikan pengalaman pengguna yang halus (*smooth*) melalui antarmuka modern dan sistem peminjaman yang terintegrasi secara real-time.

## Penjelasan Program  
Dalam membangun aplikasi **BookBorrow** ini, saya menggunakan pendekatan yang fokus pada kemudahan navigasi dan struktur kode yang rapi. Berikut adalah penjelasan teknis mengenai fungsionalitas sistem:

### 1. Arsitektur Router & OOP
Untuk menjaga agar alur aplikasi tetap teratur, saya menerapkan dua konsep utama:
* **Centralized Router (`index.php`)**: Semua permintaan URL diatur melalui satu pintu utama. File ini berfungsi sebagai pengontrol yang menentukan halaman mana yang harus ditampilkan berdasarkan parameter yang dikirim.
* **Object Oriented Programming (`models.php`)**: Saya membungkus seluruh logika interaksi database ke dalam sebuah *Class*. Hal ini bertujuan agar kode lebih modular, mudah dibaca, dan meminimalkan pengulangan kode (*dry principle*).

### 2. Manajemen Data (Admin Side)
Admin diberikan otoritas penuh untuk mengelola aset perpustakaan melalui sistem **CRUD**:
* **Pengolahan Gambar**: Admin dapat menentukan nama file cover buku yang tersinkronisasi dengan folder `assets/img/`.
* **Fleksibilitas Data**: Informasi seperti judul, penulis, dan kategori dapat diperbarui kapan saja untuk menjaga relevansi data.

### 3. Pengalaman Pengguna (User Side)
Pada sisi pengguna, saya menitikberatkan pada fungsionalitas pencarian yang cepat:
* **Responsivitas**: Antarmuka katalog menggunakan sistem *grid* yang menyesuaikan ukuran layar (Mobile Friendly).
* **Pencarian & Filter**: Pengguna dapat menyaring ratusan buku hanya dengan mengetikkan judul atau memilih kategori tertentu melalui form filter yang dinamis.

### 4. Logika Transaksi Peminjaman
Ini merupakan bagian inti dari aplikasi:
* **Automasi Jatuh Tempo**: Saat User meminjam buku, sistem secara otomatis melakukan kalkulasi tanggal hari ini ditambah 7 hari sebagai batas waktu pengembalian (*due date*).
* **Manajemen Status**: Status buku dikelola secara *real-time*. Tombol "Return Now" pada halaman histori akan mengeksekusi fungsi pembaruan status di database, sehingga riwayat transaksi pengguna selalu akurat.

## - Struktur Direktori

```text
bookborrow/
├── assets/
│   └── img/            
├── views/              
│   ├── login.php
│   ├── admin_dashboard.php
│   ├── user_catalog.php
│   └── user_history.php
├── config.php         
├── models.php          
├── index.php           
├── style.css           
└── database.sql        
```

##  Fitur Utama

### - Autentikasi Multi-Role
* **Admin**: Punya kendali penuh buat kelola seluruh database buku dan mantau jalannya sistem.
* **User**: Bisa cari buku di katalog, lihat riwayat pinjaman, dan manajemen peminjaman akun pribadi.

### - Manajemen Koleksi (CRUD Admin)
* **Tambah (Create)**: Menambahkan koleksi buku baru lengkap dengan fitur unggah gambar sampul.
* **Lihat (Read)**: Menampilkan seluruh database buku secara sistematis dan rapi.
* **Ubah (Update)**: Mengedit informasi buku (Judul, Penulis, Kategori, atau Gambar).
* **Hapus (Delete)**: Menghapus data buku dari sistem secara permanen.

### - Fitur Pengguna
* **Katalog Pintar**: Menampilkan koleksi buku dengan desain kartu (*card design*) yang modern.
* **Cari & Filter**: Fitur pencarian berdasarkan judul/penulis serta filter kategori (Fiksi, Non-Fiksi, Sains).
* **Sistem Pinjam**: Peminjaman sekali klik dengan sistem jatuh tempo otomatis (H+7).
* **Sistem Kembali**: Mengembalikan buku melalui halaman riwayat untuk memperbarui status secara otomatis.
* **Riwayat Pinjaman**: Melacak status pinjaman secara *real-time* (Dipinjam, Dikembalikan, atau Terlambat).
