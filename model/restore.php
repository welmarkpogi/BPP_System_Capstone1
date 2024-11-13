<?php

include '../server/server.php';

if (!empty($_FILES)) {
    // Validate SQL file type by extension
    if (!in_array(strtolower(pathinfo($_FILES["backup_file"]["name"], PATHINFO_EXTENSION)), array("sql"))) {
        $_SESSION['message'] = 'Invalid File Type';
        $_SESSION['status'] = 'danger';

        if (isset($_SERVER["HTTP_REFERER"])) {
            header("Location: " . $_SERVER["HTTP_REFERER"]);
            exit;
        }
    } else {
        if (is_uploaded_file($_FILES["backup_file"]["tmp_name"])) {
            move_uploaded_file($_FILES["backup_file"]["tmp_name"], $_FILES["backup_file"]["name"]);
            $response = restoreMysqlDB($_FILES["backup_file"]["name"], $conn);

            if ($response) {
                $_SESSION['message'] = 'Database restored successfully.';
                $_SESSION['status'] = 'success';
            } else {
                $_SESSION['message'] = "Database not restored completely.";
                $_SESSION['status'] = 'danger';
            }
        }

        if (isset($_SERVER["HTTP_REFERER"])) {
            header("Location: " . $_SERVER["HTTP_REFERER"]);
            exit;
        }
    }
}

function restoreMysqlDB($filePath, $conn)
{
    $sql = '';
    $error = '';
    $response = true;

    if (file_exists($filePath)) {
        $lines = file($filePath);

        // Disable foreign key checks to prevent constraint-related errors
        $conn->query("SET foreign_key_checks = 0");

        foreach ($lines as $line) {
            // Ignore comments and empty lines
            if (substr($line, 0, 2) == '--' || trim($line) === '') {
                continue;
            }

            $sql .= $line;

            // Execute SQL if line ends with a semicolon
            if (substr(trim($line), -1, 1) == ';') {
                // Handle existing tables and duplicate entries
                if (stripos($sql, 'CREATE TABLE') !== false) {
                    $sql = preg_replace('/CREATE TABLE /i', 'CREATE TABLE IF NOT EXISTS ', $sql);
                }
                if (stripos($sql, 'INSERT INTO') !== false) {
                    $sql = preg_replace('/INSERT INTO /i', 'INSERT IGNORE INTO ', $sql);
                }

                // Execute the SQL statement
                $result = $conn->query($sql);
                if (!$result) {
                    // Append error details to the error log
                    $error .= "Error executing: $sql\n" . $conn->error . "\n\n";
                    $response = false;
                }
                $sql = ''; // Reset SQL variable for the next statement
            }
        }

        // Re-enable foreign key checks
        $conn->query("SET foreign_key_checks = 1");

        // Log errors if any occurred during the restore process
        if (!$response && $error) {
            file_put_contents("restore_errors.log", $error, FILE_APPEND);
        }
    } else {
        $response = false;
    }
    
    return $response;
}
?>
