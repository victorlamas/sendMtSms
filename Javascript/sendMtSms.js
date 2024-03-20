async function sendPostRequest(url, data) {
    try {
      const response = await fetch(url, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(data),
      });
  
      // Check if the request was successful
      if (!response.ok) {
        throw new Error(`HTTP error! Status: ${response.status}`);
      }
  
      // Return the response as text
      return await response.text();
    } catch (error) {
      console.error('Error in the request:', error);
      throw error; // You might want to handle the error differently based on your application's needs
    }
  }
  
  // Target URL
  const url = 'https://www.panelsms.com/httpinput/sendMtSms.php';
  
  // JSON parameters
  const data = {
    user: 'your_api_user',
    apiKey: 'your_api_key',
    to: 'recipient',
    message: 'your_message',
  };
  
  // Perform the HTTP POST request
  sendPostRequest(url, data)
    .then((response) => {
      // Display the server response
      console.log('Server response:\n', response);
    })
    .catch((error) => {
      // Handle errors
      console.error('Error:', error);
    });
  
