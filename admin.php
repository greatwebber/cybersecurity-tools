<?php include('header.php'); ?>

<!-- Main Content -->
<div class="container mt-5">
    <!-- Refined Header Section -->


    <!-- Stats and System Health Section -->
    <div class="row">
        <div class="col-md-6 mb-4">
            <div class="card stats-card bg-primary">
                <div class="card-header">File Scan Stats</div>
                <div class="card-body">
                    <p>Total files scanned: 120</p>
                    <p>Malicious files detected: 10</p>
                    <p>Safe files: 110</p>
                </div>
            </div>
        </div>
        <div class="col-md-6 mb-4">
            <div class="card stats-card bg-success">
                <div class="card-header">System Health</div>
                <div class="card-body">
                    <p>Status: All systems running smoothly</p>
                    <p>Last scan performed: 3 hours ago</p>
                </div>
            </div>
        </div>
    </div>

    <!-- Additional Info Section -->
    <div class="row">
        <div class="col-md-12 mb-4">
            <div class="card stats-card bg-warning">
                <div class="card-header">Recent Alerts</div>
                <div class="card-body">
                    <p>New alerts detected in the last 24 hours: 3</p>
                    <p>Click here to review the alerts.</p>
                </div>
            </div>
        </div>
    </div>

</div>

<?php include('footer.php'); ?>
