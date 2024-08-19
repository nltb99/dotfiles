# MacOS & Linux
if [[ "$OSTYPE" =~ ^darwin || "$OSTYPE" =~ ^linux ]]; then
   echo 'Linking "./nvim" to "~/.config"'
   ln -s  $(pwd)/.config/nvim ~/.config

   echo 'Linking "./zshrc" to "~/"'
   ln -s  $(pwd)/.config/.zshrc ~/

   echo 'Linking "./alacritty.yml" to "~/.config"'
   ln -s  $(pwd)/.config/alacritty.yml ~/.config

   echo 'Linking ".tmux.conf" to "~/"'
   ln -s  $(pwd)/.config/.tmux.conf ~/

   echo 'Linking vscode settings'
   ln -s  $(pwd)/.config/settings.json ~/Library/Application\ Support/Code/User
   ln -s $(pwd)/.config/keybindings.json ~/Library/Application\ Support/Code/User

   echo 'Linking ".tmux.conf" to "~/"'
   ln -s  $(pwd)/.config/.tmux.conf ~/
fi

# TODO: Will update this after experienced setup with windows
# Windows
if [[ "$OSTYPE" =~ ^msys ]]; then

fi