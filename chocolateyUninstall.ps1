# Verifica se o script está sendo executado como administrador
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    # Se não for, solicita permissão do usuário para executar como administrador
    Start-Process powershell.exe -ArgumentList "-File `"$PSCommandPath`"" -Verb RunAs
    Exit
}

# Caminho para o diretório onde o executável está localizado
$executablePath = 'C:\Users\Public'

# Remove o executável do diretório do sistema
$executalbeName = "REnv.exe"
# Verifica se o executável foi removido com sucesso
if ((Test-Path "$executablePath\$executalbeName")) {
    # Remove o executável do PATH do sistema
    $escapedPath = [regex]::Escape($executablePath)
    $newPath = [Environment]::GetEnvironmentVariable("PATH", "Machine") -replace "$escapedPath;", "" -replace ";$escapedPath", ""
    [Environment]::SetEnvironmentVariable("PATH", $newPath, "Machine")
    
    Remove-Item -Path "$executablePath\$executalbeName" -Force
    # Informa o usuário sobre o sucesso
    Write-Host "Executável '$executalbeName' removido do diretório '$executablePath' e do PATH do sistema com sucesso."
}

if ((Test-Path "$env:SystemRoot\System32\$executableName")) {
    Remove-Item -Path "$env:SystemRoot\System32\$executalbeName" -Force
    # Informa o usuário sobre o sucesso
    Write-Host "Executável '$env:SystemRoot\System32' removido do diretório '$executablePath' e do PATH do sistema com sucesso."
}
else {
    Write-Host "Falha ao remover o executável '$executalbeName'."
}
