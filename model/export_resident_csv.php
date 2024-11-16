<?php 

require("../server/server.php");

// Get residents data, excluding `purok` if it does not exist
$query = "SELECT national_id, firstname, middlename, lastname, alias, birthplace, birthdate, age, civilstatus, gender, voterstatus, identified_as, phone, email, address";

// Check if `purok` exists in the table
$purokExists = $conn->query("SHOW COLUMNS FROM residents LIKE 'purok'");
if ($purokExists && $purokExists->num_rows > 0) {
    $query .= ", purok";
}

// Complete the query
$query .= " FROM residents";

if (!$result = $conn->query($query)) {
    exit("Error: " . $conn->error);
}

// Fetch and format data for CSV
$users = array();
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $users[] = $row;
    }
}

// Set CSV headers
header('Content-Type: text/csv; charset=utf-8');
header('Content-Disposition: attachment; filename=Residents.csv');
$output = fopen('php://output', 'w');

// Define CSV columns
$headers = array('National ID', 'First Name', 'Middle Name', 'Last Name', 'Alias', 'Birthplace', 'Birthdate', 'Age', 'Civil Status', 'Gender');
if ($purokExists && $purokExists->num_rows > 0) {
    $headers[] = 'Purok';
}
$headers = array_merge($headers, array('Voter Status', 'Identified As', 'Contact Number', 'Email Address', 'Address'));

fputcsv($output, $headers);

// Write data to CSV
if (count($users) > 0) {
    foreach ($users as $row) {
        fputcsv($output, $row);
    }
}

fclose($output);

?>
