# dotfiles

## Prerequisites
- Download FiraCode Nerd Font Mono from [Nerd Fonts](https://www.nerdfonts.com/font-downloads)
- On Mac OS, Disable the Ctrl+Space shortcut (Keyboard -> Shortcuts -> Input Sources -> Select the previous input source)
- On Mac OS, run `sudo xcode-select --install`

## Usage
```shell
mkdir -p src/github.com/fz42net/
git clone git@github.com:fz42net/dotfiles.git --recursive ~/src/github.com/fz42net/dotfiles/
cd ~/src/github.com/fz42net/dotfiles
./install
```

I also have a **dotfiles-private** repository that contains non-public information. The general idea is that I want all my resources available in ~/bin and ~/assets, but I don't want all of those in this public repo. Therefore, I run the following shell script in my install.conf.yml in my private repository that links all the private and public resources to the root ~/bin and ~/assets directories.
```shell
#!/usr/bin/env bash
# shellcheck shell=bash

# Define source directories
PUBLIC_BIN="$HOME/bin/public"
PRIVATE_BIN="$HOME/bin/private"
PUBLIC_ASSETS="$HOME/assets/public"
PRIVATE_ASSETS="$HOME/assets/private"

# Define target directories
TARGET_BIN="$HOME/bin"
TARGET_ASSETS="$HOME/assets"

# Function to link files from a source directory to a target directory
link_files() {
  local source_dir=$1
  local target_dir=$2

  # Create symlinks for all files
  for file in "$source_dir"/*; do
    if [ -f "$file" ] || [ -d "$file" ]; then
      ln -sf "$file" "$target_dir/$(basename "$file")"
    fi
  done
}

# Link public and private bin files
link_files "$PUBLIC_BIN" "$TARGET_BIN"
link_files "$PRIVATE_BIN" "$TARGET_BIN"

# Link public and private asset files
link_files "$PUBLIC_ASSETS" "$TARGET_ASSETS"
link_files "$PRIVATE_ASSETS" "$TARGET_ASSETS"

echo "Symlinks created successfully."
```
