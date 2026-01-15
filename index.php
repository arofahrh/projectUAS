<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);
session_start();

require_once 'models.php';
$sys = new BookSystem();

$url = $_GET['url'] ?? 'login';

// --- CONTROLLER LOGIC ---

// 1. Login
if ($url == 'login_process' && $_SERVER['REQUEST_METHOD'] == 'POST') {
    $auth = $sys->login($_POST['user'], $_POST['pass']);
    if ($auth) {
        $_SESSION['user_id'] = $auth['id'];
        $_SESSION['username'] = $auth['username'];
        $_SESSION['role'] = $auth['role'];
        header("Location: index.php?url=" . ($auth['role'] == 'admin' ? 'dashboard' : 'catalog'));
    } else {
        echo "<script>alert('Gagal Login!'); window.location='index.php?url=login';</script>";
    }
    exit();
}

// 2. Simpan Buku (Admin)
if ($url == 'save_book' && $_SERVER['REQUEST_METHOD'] == 'POST') {
    $id = $_POST['id'] ?? '';
    $img = $_POST['image'] ?: 'default.jpg';
    if (!empty($id)) {
        $sys->updateBook($id, $_POST['title'], $_POST['author'], $_POST['category'], $img);
    } else {
        $sys->addBook($_POST['title'], $_POST['author'], $_POST['category'], $img);
    }
    header("Location: index.php?url=dashboard");
    exit();
}

// 3. Delete Buku (Admin)
if ($url == 'delete') {
    $sys->deleteBook($_GET['id']);
    header("Location: index.php?url=dashboard");
    exit();
}

// 4. Peminjaman (User)
if ($url == 'borrow') {
    $sys->borrowBook($_SESSION['user_id'], $_GET['id']);
    header("Location: index.php?url=history");
    exit();
}

// 5. Pengembalian (User)
if ($url == 'return') {
    $sys->returnBook($_GET['id']);
    header("Location: index.php?url=history");
    exit();
}

// --- VIEW ROUTING ---
switch ($url) {
    case 'login':     include 'views/login.php'; break;
    case 'dashboard': include 'views/admin_dashboard.php'; break;
    case 'catalog':   include 'views/user_catalog.php'; break;
    case 'history':   include 'views/user_history.php'; break;
    case 'logout':    session_destroy(); header("Location: index.php?url=login"); break;
    default:          include 'views/login.php'; break;
}