$ErrorActionPreference = 'Stop'
$targetDir = Join-Path $HOME 'rest'
New-Item -ItemType Directory -Force -Path $targetDir | Out-Null
Copy-Item (Join-Path $PSScriptRoot 'rest.ps1') (Join-Path $targetDir 'rest.ps1') -Force
$cmdWrapper = '@echo off`r`npowershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0rest.ps1" %*`r`n'
Set-Content -LiteralPath (Join-Path $targetDir 'rest.cmd') -Value $cmdWrapper -Encoding ASCII
$userPath = [Environment]::GetEnvironmentVariable('Path', 'User')
$parts = @($userPath -split ';' | Where-Object { $_ })
if ($parts -notcontains $targetDir) { [Environment]::SetEnvironmentVariable('Path', (($parts + $targetDir) -join ';'), 'User') }
Write-Output "Installed $(Join-Path $targetDir 'rest.ps1')"
