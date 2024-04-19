# Refresh Environment Variables Function
Write-Host @"
____  _____                     
|  _ \| ____| _ __ __   __       
| |_) |  _|  | '_ \\ \ / /       
|  _ <| |___ | | | |\ V /   
|_| \_\_____||_| |_| \_/
                                                               
"@ -ForegroundColor Blue

function R-Env {   

    $envPath = [System.Environment]::GetEnvironmentVariable("PATH", "Machine") -split ";"
    $envPath += [System.Environment]::GetEnvironmentVariable("PATH", "User") -split ";"
    $envPath = $envPath | Select-Object -Unique
    [System.Environment]::SetEnvironmentVariable("PATH", ($envPath -join ";"), "Process")
}
R-Env
Write-Host "Environment variables refreshed successfully."