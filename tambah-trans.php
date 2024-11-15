<?php
session_start();
include 'koneksi.php';

$queryCustomer  = mysqli_query($koneksi, "SELECT * FROM customer");
$queryPaket     = mysqli_query($koneksi, "SELECT * FROM paket");
$rowPaket = [];
while ($data = mysqli_fetch_assoc($queryPaket)) {
    $rowPaket[] = $data;
}

// jika button simpan ditekan
if (isset($_POST['simpan'])) {
    $nama   = $_POST['nama'];
    $email  = $_POST['email'];
    $password = $_POST['password'];
    $username = $_POST['username'];
    $id_level = $_POST['id_level'];

    $queryInsert = mysqli_query($koneksi, "INSERT INTO user (id_level, nama, username, email, password) VALUES ('$id_level', '$nama', '$username', '$email','$password')");

    if ($queryInsert) {
        header("location:user.php?tambah=berhasil");
    }
    //$_POST    : form input name=""
    //$_GET     : url ?param='nilai'
    //$_FILES   : ngambil nilai dari input type file
    // if (!empty($_FILES['foto']['name'])) {
    //     $nama_foto = $_FILES['foto']['name'];
    //     $ukuran_foto = $_FILES['foto']['size'];

    //     //png,jpg,jpeg
    //     $ext = array('png', 'jpg', 'jpeg');
    //     $extFoto = pathinfo($nama_foto, PATHINFO_EXTENSION);

    //     //jika extensi foto tidak ada ext yang terdaftar di array ext
    //     if (!in_array($extFoto, $ext)) {
    //         echo "Ekstensi tidak ditemukan";
    //         die;
    //     } else {
    //         // Pindahkan gambar dari tmp ke folder yang sudah kita buat
    //         move_uploaded_file($_FILES['foto']['tmp_name'], 'upload/' . $nama_foto);
    //         $sql = "INSERT INTO user (nama,email,password,foto) VALUES ('$nama','$email','$password', '$nama_foto')";
    //         $insert = mysqli_query($koneksi, $sql);
    //     }
    // } else {
    //     $sql = "INSERT INTO user (nama,email,password) VALUES ('$nama','$email','$password')";
    //     $insert = mysqli_query($koneksi, $sql);
    // }

    // // print_r($insert);
    // // die;


    // if ($insert) {
    //     header("location:user.php?tambah=berhasil");
    // }
}
$id = isset($_GET['edit']) ? $_GET['edit'] : '';
$queryEdit = mysqli_query($koneksi, "SELECT * FROM user WHERE id = '$id'");
$rowEdit = mysqli_fetch_assoc($queryEdit);

// jika button edit di klik
if (isset($_POST['edit'])) {
    $nama  = $_POST['nama'];
    $email = $_POST['email'];
    $username = $_POST['username'];
    $id_level = $_POST['id_level'];


    // jika password diisi sama user
    if (!empty($_POST['password'])) {
        $password = $_POST['password'];
    } else {
        $password = $rowEdit['password'];
    }

    $update = mysqli_query($koneksi, "UPDATE user SET username='$username' , id_level='$id_level', nama='$nama', email='$email', password='$password' WHERE id='$id'");
    header("location:user.php?ubah=berhasil");
}

?>


<!DOCTYPE html>

<!-- =========================================================
* Sneat - Bootstrap 5 HTML Admin Template - Pro | v1.0.0
==============================================================

* Product Page: https://themeselection.com/products/sneat-bootstrap-html-admin-template/
* Created by: ThemeSelection
* License: You must have a valid license purchased in order to legally use the theme for your project.
* Copyright ThemeSelection (https://themeselection.com)

=========================================================
 -->
<!-- beautify ignore:start -->
<html
    lang="en"
    class="light-style layout-menu-fixed"
    dir="ltr"
    data-theme="theme-default"
    data-assets-path="../assets/"
    data-template="vertical-menu-template-free">

<head>
    <meta charset="utf-8" />
    <meta
        name="viewport"
        content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

    <title>Dashboard - Analytics | Sneat - Bootstrap 5 HTML Admin Template - Pro</title>

    <meta name="description" content="" />


    <?php include 'inc/head.php'; ?>
</head>

<body>
    <!-- Layout wrapper -->
    <div class="layout-wrapper layout-content-navbar">
        <div class="layout-container">
            <!-- Menu -->


            <!-- / Menu -->
            <?php include 'inc/sidebar.php'; ?>

            <!-- Layout container -->
            <div class="layout-page">
                <!-- Navbar -->

                <?php include 'inc/nav.php'; ?>

                <!-- / Navbar -->

                <!-- Content wrapper -->
                <div class="content-wrapper">
                    <!-- Content -->

                    <div class="container-xxl container-p-y">
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="card">
                                    <div class="card-header"><?php echo isset($_GET['edit']) ? 'Edit' : 'Tambah' ?> Transaksi</div>
                                    <div class="card-body">
                                        <?php if (isset($_GET['hapus'])): ?>
                                            <div class="alert alert-success" role="alert">
                                                Data berhasil dihapus
                                            </div>
                                        <?php endif ?>
                                        <form action="" method="post" enctype="multipart/form-data">
                                            <div class="mb-3 row">
                                                <div class="col-sm mb-3">
                                                    <label for="">Nama Pelanggan</label>
                                                    <select name="id_customer" id="" class="form-control">
                                                        <option value="">Pilih Customer</option>
                                                        <?php while ($row = mysqli_fetch_assoc($queryCustomer)): ?>

                                                            <option value="<?php echo $row['id'] ?>"><?php echo $row['nama_customer'] ?></option>
                                                        <?php endwhile ?>
                                                    </select>
                                                </div>
                                                <div class="mb-3 row">
                                                    <div class="col-sm-6">
                                                        <label for="" class="form-label">No Invoice</label>
                                                        <input type="text"
                                                            value="<?php echo isset($_GET['edit']) ? $rowEdit['no_transakasi'] : '' ?>"
                                                            class="form-control"
                                                            name="no_transaksi" readonly value='#'>
                                                    </div>
                                                    <div class="col-sm-6">
                                                        <label for="" class="form-label">Tanggal Laundry</label>
                                                        <input type="date"
                                                            value="<?php echo isset($_GET['edit']) ? $rowEdit['tanggal_laundry
                                                            '] : '' ?>"
                                                            class="form-control"
                                                            name="tanggal_laundry"
                                                            value="">
                                                    </div>
                                                </div>
                                                <div class="mb-3">
                                                    <button class="btn btn-primary" name="<?php echo isset($_GET['edit']) ? 'edit' : 'simpan' ?>" type="submit">simpan</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="card">
                                    <div class="card-header"><?php echo isset($_GET['edit']) ? 'Edit' : 'Tambah' ?> Detail Transaksi</div>
                                    <div class="card-body">
                                        <?php if (isset($_GET['hapus'])): ?>
                                            <div class="alert alert-success" role="alert">
                                                Data berhasil dihapus
                                            </div>
                                        <?php endif ?>
                                        <form action="" method="post" enctype="multipart/form-data">
                                            <div class="mb-3 row">
                                                <div class="col-sm-1">
                                                    <label for="">Paket</label>
                                                </div>
                                                <div class="col-md-11">
                                                    <select name="id_paket[]" id="" class="form-control">
                                                        <option value="">Pilih Paket</option>
                                                        <?php foreach ($rowPaket as $key => $value) {
                                                        } ?>

                                                        <option value="<?php echo $value['id'] ?>"><?php echo $value['nama_paket'] ?></option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="mb-3 row">
                                                <div class="col-sm-1">
                                                    <label for="" class="form-label">qty</label>
                                                </div>
                                                <div class="col-sm-11">
                                                    <input type="text"
                                                        value="<?php echo isset($_GET['edit']) ? $rowEdit['tanggal_laundry
                                                    '] : '' ?>"
                                                        class="form-control"
                                                        name="qty[]"
                                                        value="">
                                                </div>
                                            </div>
                                            <div class="mb-3 row">
                                                <div class="col-sm-1">
                                                    <label for="">Paket</label>
                                                </div>
                                                <div class="col-md-11">
                                                    <select name="id_paket[]" id="" class="form-control">
                                                        <option value="">Pilih Paket</option>
                                                        <?php foreach ($rowPaket as $key => $value) {
                                                        } ?>

                                                        <option value="<?php echo $value['id'] ?>"><?php echo $value['nama_paket'] ?></option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="mb-3 row">
                                                <div class="col-sm-1">
                                                    <label for="" class="form-label">qty</label>
                                                </div>
                                                <div class="col-sm-11">
                                                    <input type="text"
                                                        value="<?php echo isset($_GET['edit']) ? $rowEdit['tanggal_laundry
                                                    '] : '' ?>"
                                                        class="form-control"
                                                        name="qty[]"
                                                        value="">
                                                </div>
                                            </div>
                                            <div class="mb-3">
                                                <button class="btn btn-primary" name="<?php echo isset($_GET['edit']) ? 'edit' : 'simpan' ?>" type="submit">simpan</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- / Content -->

                    <!-- Footer -->
                    <footer class="content-footer footer bg-footer-theme">
                        <div class="container-xxl d-flex flex-wrap justify-content-between py-2 flex-md-row flex-column">
                            <div class="mb-2 mb-md-0">
                                ©
                                <script>
                                    document.write(new Date().getFullYear());
                                </script>
                                , made with ❤️ by
                                <a href="https://themeselection.com" target="_blank" class="footer-link fw-bolder">ThemeSelection</a>
                            </div>
                            <div>
                                <a href="https://themeselection.com/license/" class="footer-link me-4" target="_blank">License</a>
                                <a href="https://themeselection.com/" target="_blank" class="footer-link me-4">More Themes</a>

                                <a
                                    href="https://themeselection.com/demo/sneat-bootstrap-html-admin-template/documentation/"
                                    target="_blank"
                                    class="footer-link me-4">Documentation</a>

                                <a
                                    href="https://github.com/themeselection/sneat-html-admin-template-free/issues"
                                    target="_blank"
                                    class="footer-link me-4">Support</a>
                            </div>
                        </div>
                    </footer>
                    <!-- / Footer -->

                    <div class="content-backdrop fade"></div>
                </div>
                <!-- Content wrapper -->
            </div>
            <!-- / Layout page -->
        </div>

        <!-- Overlay -->
        <div class="layout-overlay layout-menu-toggle"></div>
    </div>
    <!-- / Layout wrapper -->



    <!-- Core JS -->
    <!-- build:js assets/vendor/js/core.js -->
    <script src="assets/assets/vendor/libs/jquery/jquery.js"></script>
    <script src="assets/assets/vendor/libs/popper/popper.js"></script>
    <script src="assets/assets/vendor/js/bootstrap.js"></script>
    <script src="assets/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

    <script src="assets/assets/vendor/js/menu.js"></script>
    <!-- endbuild -->

    <!-- Vendors JS -->
    <script src="assets/assets/vendor/libs/apex-charts/apexcharts.js"></script>

    <!-- Main JS -->
    <script src="assets/assets/js/main.js"></script>

    <!-- Page JS -->
    <script src="assets/assets/js/dashboards-analytics.js"></script>

    <!-- Place this tag in your head or just before your close body tag. -->
    <script async defer src="https://buttons.github.io/buttons.js"></script>
</body>

</html>