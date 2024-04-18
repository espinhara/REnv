# Refresh Environment Variables Function
Write-Host @"
____         __                  _      _____                     
|  _ \  ___  / _| _ __  ___  ___ | |__  | ____| _ __ __   __       
| |_) |/ _ \| |_ | '__|/ _ \/ __|| '_ \ |  _|  | '_ \\ \ / /       
|  _ <|  __/|  _|| |  |  __/\__ \| | | || |___ | | | |\ V /   
|_| \_\\___||_|  |_|   \___||___/|_| |_||_____||_| |_| \_/
                                                               
"@ -ForegroundColor Blue

function Refresh-Env {   

    $envPath = [System.Environment]::GetEnvironmentVariable("PATH", "Machine") -split ";"
    $envPath += [System.Environment]::GetEnvironmentVariable("PATH", "User") -split ";"
    $envPath = $envPath | Select-Object -Unique
    [System.Environment]::SetEnvironmentVariable("PATH", ($envPath -join ";"), "Process")
}
Refresh-Env
Write-Host "Environment variables refreshed successfully."