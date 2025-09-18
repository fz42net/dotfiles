#!/usr/bin/env bash
set -euo pipefail

echo "🚀 Starting dotfiles bootstrap..."

# Check for automatic detection first
if [[ -f /Library/Preferences/com.company.mdm.plist ]] || [[ "${IS_WORK:-}" == "1" ]]; then
  IS_WORK=true
  echo "📊 Auto-detected work environment (IS_WORK=true)"
else
  # Interactive prompt for work/personal selection
  echo ""
  echo "Please select your environment:"
  echo "1) 🏠 Personal workstation"
  echo "2) 📊 Work workstation"
  echo ""
  read -p "Enter your choice (1 or 2): " choice

  case $choice in
    1)
      IS_WORK=false
      echo "🏠 Selected personal environment (IS_WORK=false)"
      ;;
    2)
      IS_WORK=true
      echo "📊 Selected work environment (IS_WORK=true)"
      ;;
    *)
      echo "❌ Invalid choice. Defaulting to personal environment."
      IS_WORK=false
      echo "🏠 Defaulting to personal environment (IS_WORK=false)"
      ;;
  esac
fi

# Use local dotbot submodule
echo "🔧 Using local dotbot submodule..."
DOTBOT_DIR="$(cd "$(dirname "$0")/../dotbot"; pwd)"
DOTBOT_BIN="$DOTBOT_DIR/bin/dotbot"

if [[ ! -x "$DOTBOT_BIN" ]]; then
  echo "❌ Dotbot binary not found or not executable at $DOTBOT_BIN"
  exit 1
fi
echo "✅ Dotbot found at $DOTBOT_BIN"

# Public configs
echo "📂 Configuring public dotfiles..."
pushd "$(cd "$(dirname "$0")/.."; pwd)"
echo "🔧 Running common configuration..."
"$DOTBOT_BIN" -c install.common.yaml -p plugins/dotbot-if/if.py
if $IS_WORK; then
  echo "💼 Running work-specific configuration..."
  "$DOTBOT_BIN" -c install.work.yaml -p plugins/dotbot-if/if.py
else
  echo "🏠 Running personal configuration..."
  "$DOTBOT_BIN" -c install.personal.yaml -p plugins/dotbot-if/if.py
fi
popd

# Private repo (sparse-checkout)
echo "🔐 Setting up private dotfiles repository..."
if [[ ! -d "$HOME/src/github.com/fz42net/dotfiles-private" ]]; then
  echo "📥 Cloning private dotfiles repository..."
  git clone --no-checkout git@github.com:fz42net/dotfiles-private.git "$HOME/src/github.com/fz42net/dotfiles-private"
  pushd "$HOME/src/github.com/fz42net/dotfiles-private"
  echo "🌿 Initializing sparse checkout..."
  git sparse-checkout init --cone
  if $IS_WORK; then
    echo "💼 Setting up work-safe sparse checkout..."
    git sparse-checkout set common work install.common.yaml install.work.yaml
  else
    echo "🏠 Setting up personal sparse checkout..."
    git sparse-checkout set common work personal install.common.yaml install.personal.yaml
  fi
  echo "✅ Checking out files..."
  git checkout
else
  echo "📁 Private dotfiles repository already exists, updating..."
  pushd "$HOME/src/github.com/fz42net/dotfiles-private"
fi

echo "🔧 Running private common configuration..."
"$DOTBOT_BIN" -c install.common.yaml -p ../dotfiles/plugins/dotbot-if/if.py
if $IS_WORK; then
  echo "💼 Running private work-specific configuration..."
  "$DOTBOT_BIN" -c install.work.yaml -p ../dotfiles/plugins/dotbot-if/if.py
else
  echo "🏠 Running private personal configuration..."
  "$DOTBOT_BIN" -c install.personal.yaml -p ../dotfiles/plugins/dotbot-if/if.py
fi
popd

echo "✅ dotfiles bootstrap complete (IS_WORK=$IS_WORK)"