@echo off

set "url=https://www.panelsms.com/httpinput/sendMtSms.php"
set "user=your_api_user"
set "apikey=your_api_key"
set "recipient=recipient"
set "message=your_message"

:: Construct JSON data
set "jsonData={"user":"%user%","apikey":"%apikey%","to":"%recipient%","message":"%message%"}"

:: Save JSON data to a temporary file
echo %jsonData% > temp.json

:: Use PowerShell to send the POST request
powershell -Command "& { $response = Invoke-RestMethod -Uri '%url%' -Method Post -Body (Get-Content 'temp.json' | Out-String) -ContentType 'application/json'; Write-Output $response }"

:: Remove the temporary file
del temp.json
