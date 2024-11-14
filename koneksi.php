<?php
$host = "localhost";
$user = "root";
$password = "";
$db = "angkatan3_laundry";

$koneksi = mysqli_connect($host, $user, $password, $db);
if (!$koneksi) {
    echo "Koneksi Gagal";
}





