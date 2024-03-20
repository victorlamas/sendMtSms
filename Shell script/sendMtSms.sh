#!/bin/bash

# Target URL
url="https://www.panelsms.com/httpinput/sendMtSms.php"

# JSON parameters
data='{
  "user": "your_api_user",
  "apiKey": "your_api_key",
  "to": "recipient",
  "message": "your_message"
}'

# Perform the HTTP POST request
response=$(curl -s -X POST -H "Content-Type: application/json" -d "$data" "$url")

# Display the server response
echo "Server response:"
echo "$response"
