<?php
include "config.php"; // koneksi database

// Cek apakah form dikirim
if(isset($_POST['nama_guru'])){
    // Ambil data dari form dan escape untuk keamanan
    $nama_guru = mysqli_real_escape_string($conn, $_POST['nama_guru']);
    $username = mysqli_real_escape_string($conn, $_POST['username']);
    $password = password_hash($_POST['password'], PASSWORD_DEFAULT); // hash password

    // Cek apakah username sudah terdaftar
    $cek = mysqli_query($conn, "SELECT * FROM guru WHERE username='$username'");
    if(mysqli_num_rows($cek) > 0){
        // Username sudah ada
        echo "<script>alert('Username sudah digunakan');window.history.back();</script>";
        exit;
    }

    // Simpan data guru baru
    $query = mysqli_query($conn, "INSERT INTO guru (nama_guru, username, password) VALUES ('$nama_guru', '$username', '$password')");

    if($query){
        // Registrasi berhasil, arahkan ke login
        echo "<script>alert('Registrasi berhasil! Silakan login');window.location='loginguru.php';</script>";
    } else {
        // Jika gagal
        echo "<script>alert('Gagal registrasi');window.history.back();</script>";
    }
}
?>
