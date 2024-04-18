$aampProgamFilesPath = ([Environment]::GetFolderPath("ProgramFiles")) + "\Aamp"
New-Item $aampProgamFilesPath -Type Directory -Force

$aampBatFilePath = $aampProgamFilesPath + "\aamp-php8.2.bat"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/andreasvonburg/aamp/main/bin/php/aamp-php8.2.bat" -OutFile $aampBatFilePath

$aampIconPath = $aampProgamFilesPath + "\icon.ico"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/andreasvonburg/aamp/main/bin/php/icon.ico" -OutFile $aampIconPath

$aampStartPath = ([Environment]::GetFolderPath("CommonPrograms")) + "\Aamp"
New-Item $aampStartPath -Type Directory -Force

$shortcutPath = $aampStartPath + "\AAMP PHP 8.2.lnk"
$wScriptObj = New-Object -ComObject ("WScript.Shell")
$shortcut = $wScriptObj.CreateShortcut($shortcutPath)
$shortcut.TargetPath = $aampBatFilePath
$shortcut.TargetPath = "cmd.exe"
$shortcut.Arguments = '/C "' + $aampBatFilePath + '"'
$shortcut.IconLocation = $aampIconPath
$shortcut.Save()


while ($true) {
    $path = Read-Host -Prompt "Enter valid path to your htdocs (e. g. E:\holeradio\htdocs)"
    if (Test-Path -Path $path -PathType Container) { break }

    Write-Host "Folder does not exist. Please try again." -ForegroundColor Red
}

Write-Host "Valid path: '$path'" -ForegroundColor Green

((Get-Content -path $aampBatFilePath -Raw) -replace '_path_to_docs_', $path) | Set-Content -Path $aampBatFilePath