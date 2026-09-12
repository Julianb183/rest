REST COMMAND
============

A lightweight cross-platform sleep command for macOS, Linux, and Windows.

USAGE
-----

macOS and Linux:
  rest
  rest -a
  rest -z    # shut down completely, without a confirmation prompt
  rest -d    # restart, without a confirmation prompt
  rest -?    # show help

Windows PowerShell:
  powershell -ExecutionPolicy Bypass -File "$HOME\rest\rest.ps1"
  powershell -ExecutionPolicy Bypass -File "$HOME\rest\rest.ps1" -Shutdown
  powershell -ExecutionPolicy Bypass -File "$HOME\rest\rest.ps1" -Restart

The -a option is accepted everywhere. On macOS it passes --all to the native
rest-screen animation when that executable is installed.

PLATFORM IMPLEMENTATIONS
------------------------

macOS:
  If ~/bin/rest-screen exists, rest runs it. Otherwise it uses pmset sleepnow.
  The native animation is optional and is not included in this repository.

Linux:
  rest displays a short cancellation message and calls systemctl suspend.
  The user must have permission to suspend the system.

Windows:
  rest uses the PowerShell System.Windows.Forms Application suspend API.
  The command should be run from PowerShell.

INSTALLATION
------------

macOS:
  cd macos
  ./install.sh

Linux:
  cd linux
  ./install.sh

Windows PowerShell:
  Set-ExecutionPolicy -Scope CurrentUser RemoteSigned
  .\windows\install.ps1

Installers use the current user's PATH and do not require administrator access.
Open a new terminal after installation.

SAFETY
------

rest suspends the computer. Save work before using it. Press Ctrl+C during the
brief cancellation window where supported. The command does not shut down,
log out, or delete files.
