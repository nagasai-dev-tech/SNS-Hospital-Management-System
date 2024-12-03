<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Get form data
    $name = htmlspecialchars($_POST['name']);
    $phone = htmlspecialchars($_POST['phone']);
    $email = htmlspecialchars($_POST['email']);
    $message = htmlspecialchars($_POST['message']);
    
    // Validation (optional but recommended)
    $errors = [];

    // Validate name (check if not empty)
    if (empty($name)) {
        $errors[] = "Name is required.";
    }

    // Validate phone number (check if it is 10 digits)
    if (!preg_match("/^[0-9]{10}$/", $phone)) {
        $errors[] = "Please enter a valid 10-digit phone number.";
    }

    // Validate email (basic email validation)
    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $errors[] = "Please enter a valid email address.";
    }

    // Validate message (check if not empty)
    if (empty($message)) {
        $errors[] = "Message cannot be empty.";
    }

    // If there are errors, display them
    if (!empty($errors)) {
        foreach ($errors as $error) {
            echo "<p style='color:red;'>$error</p>";
        }
    } else {
        // Prepare email
        $to = "your-email@example.com"; // Change this to your email address
        $subject = "Contact Form Submission from $name";
        $body = "You have received a new message from the contact form.\n\n".
                "Name: $name\n".
                "Phone: $phone\n".
                "Email: $email\n".
                "Message:\n$message";
        $headers = "From: $email" . "\r\n" .
                   "Reply-To: $email" . "\r\n" .
                   "X-Mailer: PHP/" . phpversion();

        // Send the email
        if (mail($to, $subject, $body, $headers)) {
            echo "<p style='color:green;'>Thank you for contacting us! We will get back to you soon.</p>";
        } else {
            echo "<p style='color:red;'>There was an error sending your message. Please try again later.</p>";
        }
    }
}
?>
