#!/usr/bin/env bash
set -euo pipefail

if [[ -f /Library/Preferences/com.company.mdm.plist ]] || [[ "${IS_WORK:-}" == "1" ]]; then
  IS_WORK=true
else
  IS_WORK=false
fi

# Ensure dotbot is available (Linux-safe)
if ! command -v dotbot >/dev/null 2>&1; then
  python3 -m pip install --user dotbot --break-system-packages || true
  export PATH="$HOME/.local/bin:$PATH"
fi

# Public configs
pushd "$(cd "$(dirname "$0")/.."; pwd)"
dotbot -c install.common.yaml
$IS_WORK && dotbot -c install.work.yaml || dotbot -c install.personal.yaml
popd

# Private repo (sparse-checkout)
if [[ ! -d "$HOME/.dotfiles-private" ]]; then
  git clone --no-checkout git@github.com:fz42net/dotfiles-private.git "$HOME/.dotfiles-private"
  pushd "$HOME/.dotfiles-private"
  git sparse-checkout init --cone
  if $IS_WORK; then
    git sparse-checkout set common work-safe install.common.yaml install.work.yaml
  else
    git sparse-checkout set common work-safe personal-only install.common.yaml install.personal.yaml
  fi
  git checkout
else
  pushd "$HOME/.dotfiles-private"
fi

dotbot -c install.common.yaml
$IS_WORK && dotbot -c install.work.yaml || dotbot -c install.personal.yaml
popd

echo "✅ dotfiles bootstrap complete (IS_WORK=$IS_WORK)"