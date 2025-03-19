# MacOS & Linux
if [[ "$OSTYPE" =~ ^darwin || "$OSTYPE" =~ ^linux ]]; then
   ## ~/.config
   echo 'Linking nvim'
   ln -s  $(pwd)/.config/nvim ~/.config

   echo 'Linking alacritty.yml'
   # ln -s  $(pwd)/.config/alacritty.yml ~/.config
   ln -s  $(pwd)/.config/alacritty.toml ~/.config

   echo 'Linking yabai'
   ln -s  $(pwd)/.config/yabai ~/.config/yabai

   echo 'Linking skhd'
   ln -s  $(pwd)/.config/skhd ~/.config/skhd

   echo 'Linking Karabiner'
   ln -s  $(pwd)/.config/karabiner ~/.config/karabiner

   ## root
   echo 'Linking qutebrowser'
   ln -s  $(pwd)/.qutebrowser ~/

   echo 'Linking .zshrc'
   ln -s  $(pwd)/.zshrc ~/

   echo 'Linking .tmux.conf'
   ln -s  $(pwd)/.tmux.conf ~/

   echo 'Linking vscode settings'
   ln -s ~/Library/Application\ Support/Code/User/settings.json $(pwd)/.config/vscode/settings.json
   ln -s ~/Library/Application\ Support/Code/User/keybindings.json $(pwd)/.config/vscode/keybindings.json
fi

# TODO: Will update this after experiencing setup with Windows.
# Windows
if [[ "$OSTYPE" =~ ^msys ]]; then

fi