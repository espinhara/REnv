$ErrorActionPreference = 'Stop'; # Parar em todos os erros

# Define os parâmetros do pacote Chocolatey
$packageName    = 'REnv'
$softwareName   = 'REnv*'
$fileType       = 'exe'
$silentArgs     = '/qn /norestart'
$validExitCodes = @(0)
$checksumType   = 'sha256'
$url            = 'https://github.com/espinhara/REnv/raw/master/REnv.exe'
$checksum       = '9EE03085DD158BA5EAE5F80C3C306E8DB0E51C9D8EC7A0244041DAEE22248EEA'

# Instala o pacote Chocolatey
Install-ChocolateyPackage -PackageName $packageName `
                           -SoftwareName $softwareName `
                           -FileType $fileType `
                           -SilentArgs $silentArgs `
                           -ValidExitCodes $validExitCodes `
                           -ChecksumType $checksumType `
                           -Url $url `
                           -Checksum $checksum

Write-Host @"
    ____  _____                     
    |  _ \| ____| _ __ __   __       
    | |_) |  _|  | '_ \\ \ / /       
    |  _ <| |___ | | | |\ V /   
    |_| \_\_____||_| |_| \_/

"@ -ForegroundColor Blue
