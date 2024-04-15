# Refresh Environment Variables Function
function Refresh-Env {
    $envPath = [System.Environment]::GetEnvironmentVariable("PATH", "Machine") -split ";"
    $envPath += [System.Environment]::GetEnvironmentVariable("PATH", "User") -split ";"
    $envPath = $envPath | Select-Object -Unique
    [System.Environment]::SetEnvironmentVariable("PATH", ($envPath -join ";"), "Process")
}

# Main Script
Write-Host "Refreshing environment variables..."
Refresh-Env
Write-Host "Environment variables refreshed successfully."