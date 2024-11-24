<?php
require_once 'Database.php';

class Auth {
    private $db;

    public function __construct() {
        $this->db = (new Database())->pdo;
        session_start();
    }

    // Register a new user
    public function register($username, $email, $password) {
        $hashedPassword = password_hash($password, PASSWORD_DEFAULT);

        $query = "INSERT INTO users (username, email, password) VALUES (:username, :email, :password)";
        $stmt = $this->db->prepare($query);
        $stmt->bindParam(':username', $username);
        $stmt->bindParam(':email', $email);
        $stmt->bindParam(':password', $hashedPassword);

        return $stmt->execute();
    }

    // Login a user
    public function login($email, $password) {
        $query = "SELECT * FROM users WHERE email = :email";
        $stmt = $this->db->prepare($query);
        $stmt->bindParam(':email', $email);
        $stmt->execute();
        $user = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($user && password_verify($password, $user['password'])) {
            $_SESSION['user_id'] = $user['id'];
            $_SESSION['username'] = $user['username'];
            $_SESSION['is_admin'] = $user['is_admin'];  // Store the admin status in the session
            return true;
        }
        return false;
    }

    // Check if a user is logged in
    public function isLoggedIn() {
        return isset($_SESSION['user_id']);
    }

    // Check if the user is an admin
    public function isAdmin() {
        // Check if the user is logged in and has the admin status
        return isset($_SESSION['is_admin']) && $_SESSION['is_admin'] == 1;
    }

    // Logout the user
    public function logout() {
        session_unset();
        session_destroy();
    }
}
?>
