$ErrorActionPreference = 'Stop'; # stop on all errors

$packageArgs = @{
    packageName    = 'REnv'
    softwareName   = 'REnv*'
    fileType       = 'exe'
    silentArgs     = '/S'
    validExitCodes = @(0)
    checksumType   = 'sha256'
    url            = 'https://raw.githubusercontent.com/espinhara/REnv/master/renv.exe'
    checksum       = 'B69D6837C064022AEE13C7E0F52B59441E3826F26A92CDACA162B8FCDF608230'
}

Install-ChocolateyPackage @packageArgs
# Move o executável para o diretório do sistema e adiciona ao PATH
$executablePath = Join-Path $env:SystemRoot 'System32'
Copy-Item -Path $executablePath\$executableName -Destination $executablePath -Force

Write-Host @"
    ____  _____                     
    |  _ \| ____| _ __ __   __       
    | |_) |  _|  | '_ \\ \ / /       
    |  _ <| |___ | | | |\ V /   
    |_| \_\_____||_| |_| \_/

"@ -ForegroundColor Blue
# Informa o usuário sobre o sucesso
Write-Host "Executable '$executableName' moved to directory '$systemPath' and added with success to the PATH."

