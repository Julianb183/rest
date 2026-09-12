[CmdletBinding()]
param(
  [switch]$All,
  [switch]$Shutdown,
  [switch]$Restart,
  [Alias('?')][switch]$Help
)
if ($Help) {
  @('Usage: rest [-All] [-Shutdown|-Restart] [-?]', '  rest          Sleep', '  rest -Shutdown Shut down completely (no confirmation prompt)', '  rest -Restart  Restart (no confirmation prompt)')
  exit 0
}
if ($Shutdown) { shutdown.exe /s /f /t 0; exit $LASTEXITCODE }
if ($Restart) { shutdown.exe /r /f /t 0; exit $LASTEXITCODE }
Add-Type -AssemblyName System.Windows.Forms
Write-Output 'Press Ctrl+C within one second to cancel.'
Start-Sleep -Seconds 1
[System.Windows.Forms.Application]::SetSuspendState('Suspend', $false, $false)
