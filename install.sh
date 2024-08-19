# MacOS & Linux
if [[ "$OSTYPE" =~ ^darwin || "$OSTYPE" =~ ^linux ]]; then
   echo 'Linking nvim'
   ln -s  $(pwd)/.config/nvim ~/.config

   echo 'Linking alacritty.yml'
   ln -s  $(pwd)/.config/alacritty.yml ~/.config

   echo 'Linking yabai'
   ln -s  $(pwd)/.config/yabai ~/.config

   echo 'Linking skhd'
   ln -s  $(pwd)/.config/skhd ~/.config

   echo 'Linking .zshrc'
   ln -s  $(pwd)/.config/.zshrc ~/

   echo 'Linking .tmux.conf'
   ln -s  $(pwd)/.config/.tmux.conf ~/

   echo 'Linking vscode settings'
   ln -s  $(pwd)/.config/settings.json ~/Library/Application\ Support/Code/User
   ln -s $(pwd)/.config/keybindings.json ~/Library/Application\ Support/Code/User

fi

# TODO: Will update this after experienced setup with windows
# Windows
if [[ "$OSTYPE" =~ ^msys ]]; then

fi