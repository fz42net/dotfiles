# fz42net dotfiles

# Dependencies
Install homebrew
```shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

# Steps
1. Download FiraCode Nerd Font Mono from [Nerd Fonts](https://www.nerdfonts.com/font-downloads)
2. On Mac OS, Disable the Ctrl+Space shortcut (Keyboard -> Shortcuts -> Input Sources -> Select the previous input source)
3. On Mac OS, run sudo xcode-select --install
4. Install `uv` from Astral: `curl -LsSf https://astral.sh/uv/install.sh | sh`
5. Run `uv tool install dotbot`

```shell
mkdir -p ~/src/github.com/fz42net/
git clone git@github.com:fz42net/dotfiles.git --recursive ~/src/github.com/fz42net/dotfiles/
cd ~/src/github.com/fz42net/dotfiles
./scripts/bootstrap.sh
```

