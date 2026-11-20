$ErrorActionPreference = 'Stop'
$env:WSL_UTF8 = 1

$Distro      = 'aamp'
$DistroUser  = 'aamp'
$DistroPass  = 'aamp'
$HtdocsPath  = '/htdocs'


###################
# WSL distro "aamp"
###################

# The files live inside this WSL distro, so Apache in the container reads them
# with native Linux speed instead of going through the slow Windows mount.

if (-not (wsl -l -q | Where-Object { $_.Trim() -eq $Distro })) {
    Write-Host "Creating WSL distro '$Distro'..." -ForegroundColor Cyan

    wsl --install -d Debian --name $Distro --no-launch
    wsl -d $Distro -u root -- true
    wsl -d $Distro -u root -- sh -c "apt-get update && apt-get install -y sudo"
    # First user in the distro gets UID/GID 1000 (matches VUID/VGID in the bat)
    wsl -d $Distro -u root -- useradd -m -s /bin/bash -G sudo $DistroUser
    "${DistroUser}:${DistroPass}" | wsl -d $Distro -u root -- chpasswd

    # Default user (files created from Windows via \\wsl.localhost belong to him)
    wsl -d $Distro -u root -- sh -c "printf '[user]\ndefault=$DistroUser\n' > /etc/wsl.conf"

    wsl --terminate $Distro
    Write-Host "WSL distro '$Distro' created." -ForegroundColor Green
}

# htdocs root folder
wsl -d $Distro -u root -- sh -c "mkdir -p $HtdocsPath && chown ${DistroUser}:${DistroUser} $HtdocsPath"


###################
# Docker Desktop WSL integration for "aamp"
###################

# Enables the docker command inside the distro (needs Docker Desktop 4.37+)

$settingsFiles = @{
    "$env:APPDATA\Docker\settings-store.json" = 'IntegratedWslDistros'
    "$env:APPDATA\Docker\settings.json"       = 'integratedWslDistros'
}

$alreadyIntegrated = $false
foreach ($file in $settingsFiles.Keys) {
    if (-not (Test-Path $file)) { continue }
    $json = Get-Content $file -Raw | ConvertFrom-Json
    if (@($json.($settingsFiles[$file])) -contains $Distro) { $alreadyIntegrated = $true }
}

if (-not $alreadyIntegrated) {
    Write-Host "Enabling Docker Desktop WSL integration for '$Distro'..." -ForegroundColor Cyan

    # Stop Docker Desktop first so it doesn't overwrite the file
    docker desktop stop

    foreach ($file in $settingsFiles.Keys) {
        if (-not (Test-Path $file)) { continue }

        $key  = $settingsFiles[$file]
        $json = Get-Content $file -Raw | ConvertFrom-Json

        $list = @($json.$key) | Where-Object { $_ }
        if ($list -notcontains $Distro) { $list = @($list) + $Distro }

        $json | Add-Member -NotePropertyName $key -NotePropertyValue @($list) -Force

        # Write without BOM
        [System.IO.File]::WriteAllText($file, ($json | ConvertTo-Json -Depth 20), (New-Object System.Text.UTF8Encoding($false)))
        Write-Host "Updated $file"
    }

    docker desktop start
}

wsl -d $Distro -- docker version | Out-Null
if ($LASTEXITCODE -ne 0) {
    Write-Host "Docker is not available inside the WSL distro '$Distro'." -ForegroundColor Red
    Write-Host "Enable it in Docker Desktop: Settings > Resources > WSL integration > '$Distro'." -ForegroundColor Red
}


###################
# Docker image
###################

docker image rm -f andreasvonburg/aamp:php8.0


###################
# Start script and shortcut
###################

$aampProgamFilesPath = ([Environment]::GetFolderPath("ProgramFiles")) + "\Aamp"
New-Item $aampProgamFilesPath -Type Directory -Force

$aampBatFilePath = $aampProgamFilesPath + "\aamp-php8.0.bat"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/andreasvonburg/aamp/main/bin/php/aamp-php8.0.bat" -OutFile $aampBatFilePath

$aampIconPath = $aampProgamFilesPath + "\icon-8.0.ico"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/andreasvonburg/aamp/main/bin/php/icon-8.0.ico" -OutFile $aampIconPath

$aampStartPath = ([Environment]::GetFolderPath("CommonPrograms")) + "\Aamp"
New-Item $aampStartPath -Type Directory -Force

$shortcutPath = $aampStartPath + "\AAMP PHP 8.0.lnk"
$wScriptObj = New-Object -ComObject ("WScript.Shell")
$shortcut = $wScriptObj.CreateShortcut($shortcutPath)
$shortcut.TargetPath = "cmd.exe"
$shortcut.Arguments = '/C "' + $aampBatFilePath + '"'
$shortcut.IconLocation = $aampIconPath
$shortcut.Save()


###################
# Windows drive for htdocs
###################

while ($true) {
    $drive = Read-Host -Prompt "Drive letter for your htdocs in Windows (default: W)"
    if ([string]::IsNullOrWhiteSpace($drive)) { $drive = 'W' }
    $drive = $drive.Trim().TrimEnd(':', '\').ToUpper()

    if ($drive -match '^[A-Z]$') { break }

    Write-Host "Invalid drive letter. Please try again." -ForegroundColor Red
}

$drive = "${drive}:"

((Get-Content -path $aampBatFilePath -Raw) -replace '_htdocs_drive_', $drive) | Set-Content -Path $aampBatFilePath

# The drive itself is mapped by the bat file: a mapping created here (elevated)
# would not be visible in the Windows Explorer of the normal user.

Write-Host "AAMP PHP 8.0 has been installed." -ForegroundColor Green
Write-Host "Your htdocs: \\wsl.localhost\$Distro$($HtdocsPath.Replace('/','\')) (as drive $drive after the first start of AAMP)" -ForegroundColor Green
Write-Host -NoNewLine 'Press any key to continue...';
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
