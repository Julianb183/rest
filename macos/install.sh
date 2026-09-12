#!/bin/sh
set -eu
ROOT=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
mkdir -p "$HOME/bin"
cp "$ROOT/rest" "$HOME/bin/rest"
chmod +x "$HOME/bin/rest"
touch "$HOME/.zprofile"
grep -Fqx 'export PATH="$HOME/bin:$PATH"' "$HOME/.zprofile" || printf '\n# rest\nexport PATH="$HOME/bin:$PATH"\n' >> "$HOME/.zprofile"
echo "Installed $HOME/bin/rest"
