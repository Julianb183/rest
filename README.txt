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
  rest
  rest -Shutdown
  rest -Restart
  rest -?

The Windows installer also creates rest.cmd in the user rest directory. Open a
new PowerShell window after installation so the updated PATH is loaded.

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
  The installer creates a command wrapper so it can be run as `rest` from a new
Command Prompt or PowerShell window.

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

rest suspends the computer by default. `-z` shuts down and `-d` restarts
immediately. Save work before using either option; unsaved data may be lost.
