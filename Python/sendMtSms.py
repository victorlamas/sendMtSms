import requests
import json

# Target URL
url = "https://www.panelsms.com/httpinput/sendMtSms.php"

# JSON parameters
payload = {
    "user": "your_api_user",
    "apikey": "your_api_key",
    "to": "recipient",
    "message": "your_message"
}

# Perform the HTTP POST request with JSON data
response = requests.post(url, json=payload)

# Check if the request was successful (status code 200)
if response.status_code == 200:
    # Display the server response in JSON format
    print("Server response:")
    print(json.dumps(response.json(), indent=2))
else:
    print(f"Error in the request. Status code: {response.status_code}")
    print(response.text)
