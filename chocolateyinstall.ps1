# Define a URL do arquivo refreshenv.ps1 no seu repositório do GitHub
$refreshEnvScriptUrl = "https://raw.githubusercontent.com/espinhara/RefreshEnv/master/refreshenv.ps1"

# Baixa o arquivo refreshenv.ps1 para o diretório temporário
Invoke-WebRequest -Uri $refreshEnvScriptUrl -OutFile "$env:TEMP\refreshenv.ps1" -UseBasicParsing

# Copia o script refreshenv.ps1 para o diretório de instalação do Chocolatey
Copy-Item "$env:TEMP\refreshenv.ps1" "$env:USERPROFILE\refreshenv.ps1" -Force
