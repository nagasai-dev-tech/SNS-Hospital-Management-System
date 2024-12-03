<?php
// Check if the form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Get the email input
    $email = filter_var(trim($_POST['email']), FILTER_SANITIZE_EMAIL);

    // Validate the email
    if (filter_var($email, FILTER_VALIDATE_EMAIL)) {
        // Database connection details (example)
        $host = "localhost";
        $dbname = "your_database";
        $username = "your_username";
        $password = "your_password";

        // Create a connection
        try {
            $pdo = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
            $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

            // Prepare the SQL query to insert the email into the database
            $stmt = $pdo->prepare("INSERT INTO newsletter_subscribers (email) VALUES (:email)");
            $stmt->bindParam(':email', $email, PDO::PARAM_STR);

            // Execute the query
            if ($stmt->execute()) {
                echo "Thank you for subscribing!";
            } else {
                echo "There was an error subscribing. Please try again.";
            }

        } catch (PDOException $e) {
            // Handle database connection errors
            echo "Error: " . $e->getMessage();
        }
    } else {
        echo "Please enter a valid email address.";
    }
}
?>
