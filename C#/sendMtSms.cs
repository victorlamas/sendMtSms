using System;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

class Program
{
    static async Task Main()
    {
        // Target URL
        string url = "https://www.panelsms.com/httpinput/sendMtSms.php";

        // JSON parameters
        var data = new
        {
            user = "your_api_user",
            apikey = "your_api_key",
            to = "recipient",
            message = "your_message"
        };

        // Perform the HTTP POST request
        string response = await SendPostRequest(url, data);

        // Display the server response
        Console.WriteLine("Server response:\n" + response);
    }

    private static async Task<string> SendPostRequest(string url, object data)
    {
        using (HttpClient client = new HttpClient())
        {
            // Convert object to JSON
            string jsonData = Newtonsoft.Json.JsonConvert.SerializeObject(data);

            // Create StringContent with JSON data
            StringContent content = new StringContent(jsonData, Encoding.UTF8, "application/json");

            // Send POST request and get response
            HttpResponseMessage response = await client.PostAsync(url, content);

            // Ensure success status code
            response.EnsureSuccessStatusCode();

            // Read and return the response content as a string
            return await response.Content.ReadAsStringAsync();
        }
    }
}
