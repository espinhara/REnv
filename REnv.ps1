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

# Define o caminho do arquivo e o diretório de destino
$executableName = 'REnv.exe'
$folderName = 'REnv'
$currentVersion = '0.0.1'
$archive = "$env:TEMP\$folderName\$currentVersion\$executableName"
$diretorioDestino = "$env:SystemRoot\System32"

# Verifica se o arquivo de origem existe
if (Test-Path $archive) {
    if (!(Test-Path "$diretorioDestino\$executableName")) {
        # Copia o arquivo para o diretório de destino
        Copy-Item -Path $archive -Destination $diretorioDestino -Force
        
        # Verifica se o arquivo foi copiado com sucesso
        if (Test-Path "$diretorioDestino\$executableName") {
            Write-Host "Arquivo copiado com sucesso para $diretorioDestino."
        }
        else {
            Write-Host "Falha ao copiar o arquivo para $diretorioDestino."
        }
    }
}
else {
    Write-Host "O arquivo de origem $archive não foi encontrado."
}

# Verifica se o argumento "--version" ou "-v" foi fornecido
if ($args -contains "--version" -or $args -contains "-v") {
    Write-Host "REnv version: $currentVersion"
    return
}

# Chama a função para atualizar as variáveis de ambiente
R-Env
Write-Host "Variáveis de ambiente atualizadas com sucesso."
