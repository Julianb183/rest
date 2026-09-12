# rest

A small cross-platform power command for sleeping, shutting down, restarting, and displaying help.

## Platforms

- macOS: uses the native `rest-screen` animation when installed, then falls back to `pmset sleepnow`.
- Linux: uses `systemctl suspend`.
- Windows: uses PowerShell's suspend API; the installer also creates a `rest.cmd` command wrapper.

## Usage

### macOS and Linux

```sh
rest       # sleep/suspend
rest -a    # use the all-screens animation where available
rest -z    # shut down completely, without a confirmation prompt
rest -d    # restart, without a confirmation prompt
rest '-?'  # show help
```

### Windows PowerShell

```powershell
.\rest.ps1                 # sleep
.\rest.ps1 -All            # compatibility option
.\rest.ps1 -Shutdown       # shut down completely, without a confirmation prompt
.\rest.ps1 -Restart        # restart, without a confirmation prompt
.\rest.ps1 -?              # show help
```

`-a` is accepted on every platform. On macOS it passes `--all` to the native animation.

> **Warning:** `-z`/`-Shutdown` and `-d`/`-Restart` act immediately. Save your work first; unsaved data may be lost.

## Installation

Install a platform package from the [latest GitHub Release](https://github.com/Julianb183/rest/releases/latest). Each installer adds its user-level install directory to `PATH` without administrator access. On Windows, restart PowerShell after installation so the updated PATH is loaded.

- macOS: run `macos/install.sh`
- Linux: run `linux/install.sh`
- Windows: run `windows/install.ps1` in PowerShell
