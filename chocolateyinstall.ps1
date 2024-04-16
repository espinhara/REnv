# Isso define o diretório de instalação do Chocolatey para o diretório do seu perfil de usuário
$env:ChocolateyInstall = Join-Path $env:USERPROFILE "choco"

# Define a URL do arquivo refreshenv.ps1 no seu repositório do GitHub
$refreshEnvScriptUrl = "https://raw.githubusercontent.com/espinhara/RefreshEnv/master/refreshenv.ps1"

# Baixa o arquivo refreshenv.ps1 para o diretório temporário
Invoke-WebRequest -Uri $refreshEnvScriptUrl -OutFile "$env:TEMP\refreshenv.ps1" -UseBasicParsing

# Verifica se o script está sendo executado como administrador
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    # Se não for, solicita permissão do usuário para executar como administrador
    Start-Process powershell.exe -ArgumentList "-File `"$env:TEMP\refreshenv.ps1`"" -Verb RunAs
} else {
    # Se já estiver sendo executado como administrador, copia o script diretamente
    Copy-Item "$env:TEMP\refreshenv.ps1" "$env:USERPROFILE\refreshenv.ps1" -Force
}
