library(httr)
library(jsonlite)


# Target URL
url <- "https://www.panelsms.com/httpinput/sendMtSms.php"

# JSON parameters
data <- list(
  user = "your_api_user",
  apikey = "your_api_key",
  to = "recipient",
  message = "your_message"
)

# Perform the HTTP POST request
response <- POST(url, body = toJSON(data), encode = "json")

# Check if the request was successful
if (http_type(response) == "application/json" && http_status(response) == 200) {
  # Display the server response in JSON format
  cat("Server response:\n")
  print(content(response, "text"))
} else {
  cat("Error in the request.\n")
  print(content(response, "text"))
}
