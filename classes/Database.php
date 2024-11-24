<?php
class Database {
    private $host = 'localhost'; // Change if using a different host
    private $db = 'web_cybersecurity'; // Replace with your database name
    private $user = 'root'; // Replace with your database username
    private $pass = ''; // Replace with your database password
    public $pdo;

    public function __construct() {
        try {
            // Create a new PDO connection
            $this->pdo = new PDO("mysql:host={$this->host};dbname={$this->db}", $this->user, $this->pass);
            $this->pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        } catch (PDOException $e) {
            // Display an error if connection fails
            die("Database connection failed: " . $e->getMessage());
        }
    }
}
?>
