# Verifica se o script está sendo executado como administrador
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    # Se não for, solicita permissão do usuário para executar como administrador
    Start-Process powershell.exe -ArgumentList "-File `"$PSCommandPath`"" -Verb RunAs
    Exit
}

# Define o nome do executável
$executableName = "refreshenv.exe"

# Caminho para o diretório onde o executável está localizado
$executablePath = [Environment]::GetFolderPath("System")

# Remove o executável do diretório do sistema
Remove-Item -Path "$executablePath\$executableName" -Force

# Remove o executável do PATH do sistema
$newPath = [Environment]::GetEnvironmentVariable("PATH", "Machine") -replace "$executablePath;", "" -replace ";$executablePath", ""
[Environment]::SetEnvironmentVariable("PATH", $newPath, "Machine")

# Informa o usuário sobre o sucesso
Write-Host "Executável '$executablePath\$executableName' removido do diretório '$executablePath' e do PATH do sistema com sucesso."
