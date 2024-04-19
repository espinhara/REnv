# Refresh Environment Variables Function
$promptREnv = @"
____  _____                     
|  _ \| ____| _ __ __   __       
| |_) |  _|  | '_ \\ \ / /       
|  _ <| |___ | | | |\ V /   
|_| \_\_____||_| |_| \_/
                                                               
"@ 

function R-Env {   

    $envPath = [System.Environment]::GetEnvironmentVariable("PATH", "Machine") -split ";"
    $envPath += [System.Environment]::GetEnvironmentVariable("PATH", "User") -split ";"
    $envPath = $envPath | Select-Object -Unique
    [System.Environment]::SetEnvironmentVariable("PATH", ($envPath -join ";"), "Process")
}

Write-Host $promptREnv -ForegroundColor Blue

# Defina o caminho da nova pasta que você deseja adicionar ao PATH
$novaPasta = "C:\Users\Public"

# Obtenha o valor atual da variável PATH do ambiente do sistema
$valorPath = [System.Environment]::GetEnvironmentVariable("PATH", "Machine")

# Verifique se a nova pasta já está no PATH
if ($valorPath -notlike "*$novaPasta*") {
    # Adicione a nova pasta ao PATH
    $novoValorPath = "$valorPath;$novaPasta"
    
    # Defina a variável PATH com o novo valor
    [System.Environment]::SetEnvironmentVariable("PATH", $novoValorPath, "Machine")

    Write-Host "A pasta $novaPasta foi adicionada ao PATH."
}
# else {
#     Write-Host "A pasta $novaPasta já está no PATH."
# }

if ($args -contains "--version" -or $args -contains "-v") {
    Write-Host "REnv version: 0.0.1"
    return
}
R-Env
Write-Host "Environment variables refreshed successfully."