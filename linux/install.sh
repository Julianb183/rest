#!/bin/sh
set -eu
ROOT=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
mkdir -p "$HOME/.local/bin"
cp "$ROOT/rest" "$HOME/.local/bin/rest"
chmod +x "$HOME/.local/bin/rest"
for rc in "$HOME/.profile" "$HOME/.bashrc" "$HOME/.zshrc"; do touch "$rc"; grep -Fqx 'export PATH="$HOME/.local/bin:$PATH"' "$rc" || printf '\n# rest\nexport PATH="$HOME/.local/bin:$PATH"\n' >> "$rc"; done
echo "Installed $HOME/.local/bin/rest"
