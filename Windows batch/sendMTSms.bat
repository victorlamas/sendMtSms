@echo off
setlocal enabledelayedexpansion

:: Target URL
set "url=https://www.panelsms.com/httpinput/sendMtSms.php"

:: JSON parameters
set "data={\"user\":\"your_api_user\",\"apikey\":\"your_api_key\",\"to\":\"recipient\",\"message\":\"your_message\"}"

:: Perform the HTTP POST request using PowerShell
powershell -Command "& { $response = Invoke-RestMethod -Uri '%url%' -Method Post -Body '%data%' -ContentType 'application/json'; Write-Output $response }"

