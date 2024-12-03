docker image rm -f andreasvonburg/aamp:php8.4

$aampProgamFilesPath = ([Environment]::GetFolderPath("ProgramFiles")) + "\Aamp"
New-Item $aampProgamFilesPath -Type Directory -Force

$aampBatFilePath = $aampProgamFilesPath + "\aamp-php8.4.bat"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/andreasvonburg/aamp/main/bin/php/aamp-php8.4.bat" -OutFile $aampBatFilePath

$aampIconPath = $aampProgamFilesPath + "\icon-8.4.ico"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/andreasvonburg/aamp/main/bin/php/icon-8.4.ico" -OutFile $aampIconPath

$aampStartPath = ([Environment]::GetFolderPath("CommonPrograms")) + "\Aamp"
New-Item $aampStartPath -Type Directory -Force

$shortcutPath = $aampStartPath + "\AAMP PHP 8.4.lnk"
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

Write-Host "Folder is valid: '$path'" -ForegroundColor Green

((Get-Content -path $aampBatFilePath -Raw) -replace '_path_to_docs_', $path) | Set-Content -Path $aampBatFilePath

Write-Host "AAMP PHP 8.4 has been installed." -ForegroundColor Green
Write-Host -NoNewLine 'Press any key to continue...';
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');