$toolsPath = Split-Path -parent $MyInvocation.MyCommand.Definition

# Copy the RefreshEnv script to the user's home directory
Copy-Item "$toolsPath\refreshenv.ps1" "$env:USERPROFILE\refreshenv.ps1" -Force

# Add the RefreshEnv script to the user's profile
Add-Content -Path $PROFILE -Value "`r`n. '$env:USERPROFILE\refreshenv.ps1'"

