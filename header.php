<!-- header.php -->
<?php
// header.php
ini_set('display_errors', 1);  // Display errors
error_reporting(E_ALL);
require_once 'classes/Auth.php';
require_once 'classes/MalwareScanner.php';

$auth = new Auth();
$scanner = new MalwareScanner();

// Check if the user is logged in as admin
if (!$auth->isAdmin()) {
    header("Location: login.php"); // Redirect to login if not admin
    exit;
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - Cybersecurity Tool</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f4f7fa;
        }
        .navbar {
            background-color: #343a40;
        }
        .navbar a {
            color: #ffffff !important;
        }
        .navbar a:hover {
            color: #ffc107 !important;
        }
        .card {
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .dashboard-header {
            color: #343a40;
            font-weight: bold;
            font-size: 2rem;
            margin-bottom: 30px;
        }
        .stats-card {
            padding: 20px;
            border-radius: 10px;
            color: #ffffff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .card-header {
            font-size: 1.25rem;
            font-weight: bold;
        }
        .card-body {
            font-size: 1.125rem;
        }
        .footer {
            text-align: center;
            margin-top: 30px;
            padding: 10px;
            background-color: #343a40;
            color: #ffffff;
        }
        .content {
            background-color: #ffffff;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .content p {
            font-size: 1.1rem;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Cybersecurity Tool</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link" href="admin.php">Dashboard</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="malicious_files.php">Malicious Files Scanner</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="deep_scan.php">Deep Scan</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="scan_customization.php">Scan Customization</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="detailed_info.php">Detailed Information</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="security_check.php">Security Check</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="logout.php">Logout</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
