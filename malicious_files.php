<?php
require_once './classes/Database.php';


include('header.php');

$database = new Database();
$db = $database->pdo;  // Assume $db is the database connection

// Function to update scan status
function updateScanStatus($analysisId, $db) {
    $url = "https://www.virustotal.com/api/v3/analyses/$analysisId";
    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_HTTPHEADER, [
        "x-apikey: cfac2931bdb25c962749aeb53487ea289d444f8504322bcb46b8b49806856cb4",
    ]);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    $response = curl_exec($ch);
    curl_close($ch);

    $result = json_decode($response, true);
    if (isset($result['data']['attributes']['status'])) {
        $status = $result['data']['attributes']['status'] === 'completed' ? 'completed' : 'queued';
        $malicious = isset($result['data']['attributes']['stats']['malicious']) ? $result['data']['attributes']['stats']['malicious'] : 0;
        $total = isset($result['data']['attributes']['stats']['total']) ? $result['data']['attributes']['stats']['total'] : 0;

        // Update the database
        $stmt = $db->prepare("
            UPDATE file_scans 
            SET status = ?, malicious_engines = ?, total_engines = ?, updated_at = CURRENT_TIMESTAMP 
            WHERE analysis_id = ?
        ");
        // Execute the prepared statement
        $stmt->execute([$status, $malicious, $total, $analysisId]);
    }
}

// File upload and VirusTotal submission logic
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_FILES['file'])) {
    $file = $_FILES['file'];
    $filePath = $file['tmp_name'];
    $fileName = $file['name'];

    // Save the file locally
    $uploadDir = 'uploads/';
    $savedFilePath = $uploadDir . basename($fileName);
    move_uploaded_file($filePath, $savedFilePath);

    // Submit the file to VirusTotal
    $apiKey = "cfac2931bdb25c962749aeb53487ea289d444f8504322bcb46b8b49806856cb4";
    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, "https://www.virustotal.com/api/v3/files");
    curl_setopt($ch, CURLOPT_POST, true);
    curl_setopt($ch, CURLOPT_HTTPHEADER, ["x-apikey: $apiKey"]);
    curl_setopt($ch, CURLOPT_POSTFIELDS, ['file' => new CURLFile($savedFilePath)]);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

    $response = curl_exec($ch);
    curl_close($ch);

    $data = json_decode($response, true);
    $analysisId = isset($data['data']['id']) ? $data['data']['id'] : null;

    if ($analysisId) {
        $user_id = $_SESSION['user_id'];
        // Insert the scan record into the database
        $stmt = $db->prepare("INSERT INTO file_scans (file_name, file_path, analysis_id, status,user_id) VALUES (?, ?, ?, 'queued', ?)");
        $stmt->execute([$fileName, $savedFilePath, $analysisId,$user_id]);
    }
}

// Handle AJAX requests for status updates
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['analysis_id'])) {
    $analysisId = $_POST['analysis_id'];

    // Update the scan status
    updateScanStatus($analysisId, $db);

    // Fetch updated scan status from the database using PDO
    $stmt = $db->prepare("SELECT status, malicious_engines, total_engines FROM file_scans WHERE analysis_id = :analysis_id");
    $stmt->bindParam(':analysis_id', $analysisId, PDO::PARAM_STR);
    $stmt->execute();

    // Fetch the result as an associative array
    $data = $stmt->fetch(PDO::FETCH_ASSOC);

    // Check if data is found, otherwise return an error
    if ($data) {
        echo json_encode($data);
    } else {
        echo json_encode(['error' => 'No record found']);
    }

    exit;
}
?>


<!-- Main Content -->
<div class="container mt-5">
    <h2 class="text-center mb-4">Malicious Files Scanner</h2>

    <!-- Form Section -->
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">Scan a File</div>
                <div class="card-body">
                    <form action="malicious_files.php" method="POST" enctype="multipart/form-data">
                        <div class="mb-3">
                            <label for="file" class="form-label">Select File</label>
                            <input type="file" class="form-control" id="file" name="file" required>
                        </div>
                        <button type="submit" class="btn btn-primary">Scan File</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Status Message -->
    <?php if (isset($statusMessage) && $statusMessage): ?>
        <div class="alert alert-info mt-3"><?php echo htmlspecialchars($statusMessage); ?></div>
    <?php endif; ?>

    <!-- Files Table Section -->
    <div class="row mt-5">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">Scanned Files</div>
                <div class="card-body">
                    <table class="table table-striped">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>File Name</th>
                            <th>Scan Status</th>
                            <th>Malicious Engines</th>
                            <th>Total Engines</th>
                            <th>Date Scanned</th>
                        </tr>
                        </thead>
                        <tbody>
                        <?php
                        $user_id = $_SESSION['user_id'];
                        // Use a prepared statement for better security and to handle any potential errors
                        $query = "SELECT * FROM file_scans WHERE user_id ='$user_id' ORDER BY created_at DESC";
                        $stmt = $db->prepare($query);
                        $stmt->execute();

                        // Fetch all rows from the result set
                        $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
                        $count = 1;

                        foreach ($rows as $row) {
                            echo "<tr id='scan-row-{$row['analysis_id']}'>";
                            echo "<td>{$count}</td>";
                            echo "<td>" . htmlspecialchars($row['file_name']) . "</td>";
                            echo "<td class='scan-status'>" . ucfirst($row['status']) . "</td>";
                            echo "<td class='malicious-engines'>{$row['malicious_engines']}</td>";
                            echo "<td class='total-engines'>{$row['total_engines']}</td>";
                            echo "<td>{$row['created_at']}</td>";
                            echo "</tr>";
                            $count++;
                        }
                        ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    // AJAX polling to update scan statuses
    const rows = $("tr[id^='scan-row-']");
    rows.each(function() {
        const row = $(this);
        const analysisId = row.attr("id").replace("scan-row-", "");

        // Check if the current status is 'queued'
        if (row.find('.scan-status').text().toLowerCase() === 'queued') {
            const interval = setInterval(() => {
                $.ajax({
                    url: 'malicious_files.php', // Make sure this points to the correct PHP file
                    method: 'POST',  // Changed to POST
                    data: { analysis_id: analysisId }, // Send data as POST
                    dataType: 'json',
                    success: function(data) {
                        console.log('AJAX Response Data:', data); // Log the raw response data
                        if (data.status) {
                            const statusCell = row.find('.scan-status');
                            const maliciousEnginesCell = row.find('.malicious-engines');
                            const totalEnginesCell = row.find('.total-engines');

                            // Update the status
                            if (statusCell.text().toLowerCase() !== data.status.toLowerCase()) {
                                statusCell.text(data.status.charAt(0).toUpperCase() + data.status.slice(1));

                                // Update malicious engines and total engines when status is 'completed'
                                if (data.status === 'completed') {
                                    maliciousEnginesCell.text(data.malicious_engines);
                                    totalEnginesCell.text(data.total_engines);

                                    // Refresh the page after status is completed
                                    location.reload(); // This will refresh the page

                                    // Stop polling after status is completed
                                    clearInterval(interval);
                                }
                            }
                        }
                        else if (data.error) {
                            console.error('Error response from server:', data.error);
                        }
                    },
                    error: function(xhr, status, error) {
                        console.error('AJAX Error:', status, error);
                        console.log('Response:', xhr.responseText); // Log the raw response text for debugging
                    }
                });
            }, 60000); // Poll every minute
        }
    });


</script>


<?php include('footer.php'); ?>
