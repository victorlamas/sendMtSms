import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

public class HttpPostExample {

    public static void main(String[] args) throws Exception {
        // Target URL
        String url = "https://www.panelsms.com/httpinput/sendMtSms.php";

        // JSON parameters
        Map<String, String> data = new HashMap<>();
        data.put("user", "your_api_user");
        data.put("apiKey", "your_api_key");
        data.put("to", "recipient");
        data.put("message", "your_message");

        // Perform the HTTP POST request
        String response = sendPostRequest(url, data);

        // Display the server response
        System.out.println("Server response:\n" + response);
    }

    private static String sendPostRequest(String url, Map<String, String> data) throws Exception {
        URL obj = new URL(url);
        HttpURLConnection con = (HttpURLConnection) obj.openConnection();

        // Set the request method to POST
        con.setRequestMethod("POST");

        // Enable input/output streams
        con.setDoOutput(true);

        // Build JSON data
        StringBuilder jsonData = new StringBuilder();
        jsonData.append("{");
        for (Map.Entry<String, String> entry : data.entrySet()) {
            jsonData.append("\"").append(entry.getKey()).append("\":\"").append(entry.getValue()).append("\",");
        }
        jsonData.deleteCharAt(jsonData.length() - 1); // Remove the trailing comma
        jsonData.append("}");

        // Set request headers
        con.setRequestProperty("Content-Type", "application/json");

        // Write JSON data to the output stream
        try (OutputStream os = con.getOutputStream()) {
            byte[] input = jsonData.toString().getBytes("utf-8");
            os.write(input, 0, input.length);
        }

        // Get the server response
        try (BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()))) {
            String inputLine;
            StringBuilder response = new StringBuilder();
            while ((inputLine = in.readLine()) != null) {
                response.append(inputLine);
            }
            return response.toString();
        }
    }
}
