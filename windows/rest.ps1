[CmdletBinding()]
param([switch]$All)
Add-Type -AssemblyName System.Windows.Forms
Write-Output 'Press Ctrl+C within one second to cancel.'
Start-Sleep -Seconds 1
[System.Windows.Forms.Application]::SetSuspendState('Suspend', $false, $false)
