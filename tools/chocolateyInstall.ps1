# Define a URL do arquivo refreshenv.ps1 no seu repositório do GitHub
$refreshEnvScriptUrl = "https://raw.githubusercontent.com/espinhara/RefreshEnv/master/refreshenv.exe"

# Baixa o arquivo refreshenv.ps1 para o diretório temporário
Invoke-WebRequest -Uri $refreshEnvScriptUrl -OutFile "$env:TEMP\refreshenv.exe" -UseBasicParsing

# Caminho para o diretório onde o executável está localizado
$executablePath = "$env:TEMP"

# Nome do executável
$executableName = "refreshenv.exe"

# Caminho para a pasta no PATH do sistema (por exemplo, C:\Windows\System32)
$systemPath = [Environment]::GetFolderPath("System")

# Verifica se a pasta já está no PATH
if (-not ($env:PATH -split ";" | Where-Object { $_ -eq $systemPath })) {
    # Adiciona a pasta ao PATH
    $newPath = $env:PATH + ";$systemPath"
    [Environment]::SetEnvironmentVariable("PATH", $newPath, "Machine")
}

# Verifica se o script está sendo executado como administrador
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    # Se não for, solicita permissão do usuário para executar como administrador
    $scriptPath = $MyInvocation.MyCommand.Path
    Start-Process powershell.exe -ArgumentList "-File `"$scriptPath`"" -Verb RunAs
}
else {
    # Se já estiver sendo executado como administrador, copia o script diretamente
    Copy-Item "$executablePath\$executableName" "$systemPath\$executableName" -Force

    Write-Host @"
    ____         __                  _      _____                     
    |  _ \  ___  / _| _ __  ___  ___ | |__  | ____| _ __ __   __       
    | |_) |/ _ \| |_ | '__|/ _ \/ __|| '_ \ |  _|  | '_ \\ \ / /       
    |  _ <|  __/|  _|| |  |  __/\__ \| | | || |___ | | | |\ V /   
    |_| \_\\___||_|  |_|   \___||___/|_| |_||_____||_| |_| \_/

"@ -ForegroundColor Blue
    # Informa o usuário sobre o sucesso
    Write-Host "Executable '$executableName' moved to directory '$systemPath' and added with success to the PATH."
}
