<?php
session_start();
include "config.php";

if(isset($_POST['username'])){
    $username = mysqli_real_escape_string($conn, $_POST['username']);
    $password = $_POST['password'];

    $q = mysqli_query($conn, "SELECT * FROM guru WHERE username='$username'");
    if(mysqli_num_rows($q) == 1){
        $data = mysqli_fetch_assoc($q);
        if(password_verify($password, $data['password'])){
            $_SESSION['id_guru'] = $data['id_guru'];
            $_SESSION['nama_guru'] = $data['nama_guru'];
            header("Location: dashboard.php");
            exit;
        } else {
            echo "<script>alert('Password salah');window.history.back();</script>";
        }
    } else {
        echo "<script>alert('Username tidak ditemukan');window.history.back();</script>";
    }
}
?>
