# Verifica se o script está sendo executado como administrador
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    # Se não for, solicita permissão do usuário para executar como administrador
    Start-Process powershell.exe -ArgumentList "-File `"$PSCommandPath`"" -Verb RunAs
    Exit
}

# Define as variáveis
$folderName = 'REnv'
$currentVersion = '0.0.1'
$executableName = 'REnv.exe'
$executablePath = "$env:TEMP\$folderName\$currentVersion"

# Função para remover o executável
function Remove-Executable {
    param (
        [string]$path
    )
    if (Test-Path $path) {
        Remove-Item -Path $path -Force
        Write-Host "Executável '$executableName' removido do diretório '$path' com sucesso."
    } else {
        Write-Host "Falha ao remover o executável '$executableName' do diretório '$path'."
    }
}

# Remove o executável do diretório temporário e do PATH do sistema
Remove-Executable -path "$executablePath\$executableName"

# Remove o executável do diretório System32, se estiver presente
Remove-Executable -path "$env:SystemRoot\System32\$executableName"
