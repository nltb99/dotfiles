# MacOS & Linux
if [[ "$OSTYPE" =~ ^darwin || "$OSTYPE" =~ ^linux ]]; then
   echo 'Linking "./nvim" to "~/.config"'
   # ln -s  $(pwd)/nvim ~/.config

   echo 'Linking "./zshrc" to "~/"'
   ln -s  $(pwd)/.zshrc ~/

   echo 'Linking "./alacritty.yml" to "~/.config"'
   ln -s  $(pwd)/alacritty.yml ~/.config

   echo 'Linking ".tmux.conf" to "~/"'
   ln -s  $(pwd)/.tmux.conf ~/

   echo 'Linking vscode settings'
   ln -s  $(pwd)/settings.json ~/Library/Application\ Support/Code/User
   ln -s $(pwd)/keybindings.json ~/Library/Application\ Support/Code/User
fi

# TODO: Will update this after experienced setup with windows
# Windows
if [[ "$OSTYPE" =~ ^msys ]]; then

fi