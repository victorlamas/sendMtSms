<?php

// Target URL
$url = "https://www.panelsms.com/httpinput/sendMtSms.php";

// JSON parameters
$data = array(
    "user" => "your_api_user",
    "apiKey" => "your_api_key",
    "to" => "recipient",
    "message" => "your_message"
);

// Configure HTTP POST request
$options = array(
    'http' => array(
        'header'  => "Content-type: application/json",
        'method'  => 'POST',
        'content' => json_encode($data),
    ),
);

// Create the HTTP context
$context = stream_context_create($options);

// Perform the HTTP POST request and get the response
$response = file_get_contents($url, false, $context);

// Check if the request was successful
if ($response !== false) {
    // Display the server response in JSON format
    echo "Server response:\n";
    echo json_encode(json_decode($response), JSON_PRETTY_PRINT);
} else {
    echo "Error in the request.\n";
}

?>
