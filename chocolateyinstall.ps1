$profilePath = $PROFILE.CurrentUserAllHosts
Add-Content -Path $profilePath -Value "`r`n. '$env:USERPROFILE\refreshenv.ps1'" -Force


