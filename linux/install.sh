#!/bin/sh
set -eu
ROOT=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
mkdir -p "$HOME/.local/bin"
cp "$ROOT/rest" "$HOME/.local/bin/rest"
chmod +x "$HOME/.local/bin/rest"
rc="$HOME/.profile"
touch "$rc"
grep -Fqx 'export PATH="$HOME/.local/bin:$PATH"' "$rc" || printf '\n# rest\nexport PATH="$HOME/.local/bin:$PATH"\n' >> "$rc"
echo "Installed $HOME/.local/bin/rest"
