
# libnss-myhostname

anysub.localhost

https://serverfault.com/questions/1065513/how-does-linux-resolve-wildcard-locahost-subdomains-e-g-ping-test-localhost


# ico

https://convertico.com/

# host network (does not work on apple)
docker run ....
 --network="host" \
 ...

# ps wsl tests

```powershell
$env:WSL_UTF8 = 1

$Distro  = 'aamp'
$User    = 'aamp'
$Pass    = 'aamp'

#wsl --unregister $Distro

if (-not (wsl -l -q | Where-Object { $_.Trim() -eq $Distro })) {
    wsl --install -d Debian --name aamp --no-launch
    wsl -d $Distro -u root -- true
    wsl -d $Distro -u root -- sh -c "apt-get update && apt-get install -y sudo"
    wsl -d $Distro -u root -- useradd -m -s /bin/bash -G sudo $User
    "${User}:${Pass}" | wsl -d $Distro -u root -- chpasswd

    # Default user and systemd
    wsl -d $Distro -u root -- sh -c "printf '[user]\ndefault=$User\n\n[boot]\nsystemd=true\n' > /etc/wsl.conf"

    #wsl -d $Distro -u $User -- mkdir -p /home/$User/htdocs

    wsl --terminate $Distro
    Write-Host 'Done.'
}

## Enabled docker desktop wsl integration of aamp

$distro = "aamp"

# Stop Docker Desktop first so it doesn't overwrite the file (needs Docker Desktop 4.37+)
docker desktop stop

$files = "$env:APPDATA\Docker\settings-store.json",
         "$env:APPDATA\Docker\settings.json"

foreach ($file in $files) {
    if (-not (Test-Path $file)) {
        continue
    }

    $json = Get-Content $file -Raw | ConvertFrom-Json

    # Current list (empty if the key doesn't exist yet)
    $list = @($json.IntegratedWslDistros) | Where-Object { $_ }
    if ($list -notcontains $distro) {
        $list = @($list) + $distro
    }

    $json | Add-Member -NotePropertyName IntegratedWslDistros -NotePropertyValue @($list) -Force

    # Write without BOM
    [System.IO.File]::WriteAllText($file, ($json | ConvertTo-Json -Depth 20), (New-Object System.Text.UTF8Encoding($false)))
    Write-Host "Updated $file"
}

docker desktop start



#$Drive = 'X:'
#$DriveHtdocs = 'W:'

#subst $DriveHtdocs /d
#net use $Drive /delete

#net use $Drive "\\wsl.localhost\$Distro" /persistent:yes
#subst $DriveHtdocs ${Drive}\home\$User\htdocs
```

