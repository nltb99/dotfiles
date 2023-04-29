# Link neovim
ln -s  $(pwd)/nvim ~/.config

# Link zsh
ln -s  $(pwd)/.zshrc ~/

if [[ "$OSTYPE" =~ ^darwin ]]; then
    # Link alacritty config
   ln -s  $(pwd)/alacritty.yml ~/.config

    # Link tmux config
   ln -s  $(pwd)/.tmux.conf ~/

    # Link vscode settings
   ln -s  $(pwd)/settings.json ~/Library/Application\ Support/Code/User
   ln -s $(pwd)/keybindings.json ~/Library/Application\ Support/Code/User
fi

if [[ "$OSTYPE" =~ ^linux ]]; then
   # Linux
fi

if [[ "$OSTYPE" =~ ^msys ]]; then
   # Windows
fi