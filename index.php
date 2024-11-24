<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cybersecurity Tool</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .hero-section {
            background-color: #2c3e50;
            color: white;
            padding: 100px 0;
        }
        .feature-icon {
            font-size: 2rem;
            color: #3498db;
        }
        .feature {
            background-color: #ecf0f1;
            padding: 30px;
            border-radius: 8px;
            margin: 15px 0;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .feature h3 {
            color: #2c3e50;
        }
        .feature p {
            color: #7f8c8d;
        }
        .navbar-custom {
            background-color: #34495e;
        }
        .navbar-custom a {
            color: white;
        }
        .navbar-custom .navbar-toggler-icon {
            background-color: white;
        }
        .cta-button {
            background-color: #3498db;
            color: white;
            border: none;
            padding: 12px 30px;
            border-radius: 50px;
            text-transform: uppercase;
            font-weight: bold;
            cursor: pointer;
        }
        .cta-button:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-custom navbar-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Cybersecurity Tool</a>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link" href="login.php">Login</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="register.php">Register</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="hero-section text-center text-white">
    <h1>Welcome to the Cybersecurity Tool</h1>
    <p class="lead">Your one-stop solution for scanning and analyzing files for malware and security threats.</p>
    <button class="cta-button mt-4" onclick="window.location.href='register.php'">Get Started</button>
</div>

<div class="container my-5">
    <h2 class="text-center mb-5">Key Features</h2>
    <div class="row">
        <div class="col-md-4">
            <div class="feature">
                <div class="feature-icon text-center">
                    <i class="bi bi-shield-lock"></i>
                </div>
                <h3 class="text-center">Malware Detection</h3>
                <p>Our tool scans files for malicious content and alerts you to potential threats, ensuring your files remain safe and secure.</p>
            </div>
        </div>
        <div class="col-md-4">
            <div class="feature">
                <div class="feature-icon text-center">
                    <i class="bi bi-cloud-arrow-down"></i>
                </div>
                <h3 class="text-center">Real-time Analysis</h3>
                <p>Experience real-time scanning and get updated immediately when your files are safe or flagged as suspicious.</p>
            </div>
        </div>
        <div class="col-md-4">
            <div class="feature">
                <div class="feature-icon text-center">
                    <i class="bi bi-person-check"></i>
                </div>
                <h3 class="text-center">User Management</h3>
                <p>Manage your account, check scan results, and control your settings with an intuitive user interface. Admin features are also available for enhanced management.</p>
            </div>
        </div>
    </div>
</div>

<div class="container my-5">
    <h2 class="text-center mb-5">How It Works</h2>
    <div class="row text-center">
        <div class="col-md-4">
            <h3>Step 1: Register or Login</h3>
            <p>Create an account or log in to access all features. This gives you access to file scanning and account management.</p>
        </div>
        <div class="col-md-4">
            <h3>Step 2: Upload Your File</h3>
            <p>Once logged in, upload the file you want to scan. The tool will check for any threats and provide results in real-time.</p>
        </div>
        <div class="col-md-4">
            <h3>Step 3: Analyze & Secure</h3>
            <p>Review the scan results. If any malicious threats are detected, take action immediately to secure your device.</p>
        </div>
    </div>
</div>

<div class="container my-5 text-center">
    <h2>Join Us Today!</h2>
    <p>Sign up now and start scanning your files for security threats. Stay protected and secure with the Cybersecurity Tool.</p>
    <button class="cta-button" onclick="window.location.href='register.php'">Get Started</button>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
