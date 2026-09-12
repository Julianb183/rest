# rest

A small cross-platform command that puts a computer to sleep.

## Platforms

- macOS: uses the native `rest-screen` animation when installed, then falls back to `pmset sleepnow`.
- Linux: uses `systemctl suspend`.
- Windows: uses PowerShell's suspend API.

## Usage

```sh
rest
rest -a
```

`-a` is accepted on every platform. On macOS it passes `--all` to the native animation.

Install the platform package from the latest GitHub Release. Each installer adds its user-level install directory to PATH without administrator access.
