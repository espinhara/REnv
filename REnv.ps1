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
$archive = "C:\Users\Public\REnv.exe"
$diretorioDestino = "$env:SystemRoot\System32"
#Verifica se o arquivo de origem existe
if (Test-Path $archive) {
    # Copia o arquivo para o diretório de destino
    Copy-Item -Path $archive -Destination $diretorioDestino -Force
    
    # Verifica se o arquivo foi copiado com sucesso
    if (Test-Path (Join-Path $diretorioDestino (Split-Path $archive -Leaf))) {
        Write-Host "Arquivo copiado com sucesso para $diretorioDestino."
    }
    else {
        Write-Host "Falha ao copiar o arquivo para $diretorioDestino."
    }
}
else {
    Write-Host "O arquivo de origem $archive não foi encontrado."
}

if ($args -contains "--version" -or $args -contains "-v") {
    Write-Host "REnv version: 0.0.1"
    return
}
R-Env
Write-Host "Environment variables refreshed successfully."