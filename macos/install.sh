#!/bin/sh
set -eu
ROOT=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
mkdir -p "$HOME/bin"
cp "$ROOT/rest" "$HOME/bin/rest"
chmod +x "$HOME/bin/rest"
for profile in "$HOME/.zprofile" "$HOME/.bash_profile"; do
  touch "$profile"
  grep -Fqx 'export PATH="$HOME/bin:$PATH"' "$profile" || printf '\n# rest\nexport PATH="$HOME/bin:$PATH"\n' >> "$profile"
done
echo "Installed $HOME/bin/rest"
