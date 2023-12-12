### Dotfiles

My personal settings, crafted to enhance productivity and my workflow when engaging with code.
The following configurations are:

- Neovim
- Zsh
- VSCode
- Tmux (multiplexer)
- Alacritty (terminal)
- Kitty (terminal)
- vimium (browser extension)

![](./screenshot/screenshot_1.png)
![](./screenshot/screenshot_2.png)
![](./screenshot/screenshot_3.png)

## Installation

```shell
./install.sh
```

### Prerequisites

- Neovim >= v0.9.x

###### macOS

```sh
# Neovim
brew install chafa gnu-sed imagemagick lazygit lua luajit prettier eslint

# Searcher
brew install ripgrep fzf the_silver_searcher

# Python
brew install black flake8 poetry pyenv python-setuptools python-packaging

# Optionals
brew install cmatrix yarn tree neovim git tmux gcc gpp gh go htop n node wget zoxide
```

###### Linux

> **NOTE:** This section will be updated soon!

###### Windows

> **NOTE:** This section will be updated soon!

## vim-plug

###### macOS

```sh
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

###### Linux

```sh
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

###### Windows (PowerShell)

```powershell
iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni "$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim-data/site/autoload/plug.vim" -Force
```

## Keybindings

> **NOTE:** This section will be updated soon!

## Fonts

```py
# FuraCode Nerd Font
https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/FiraCode.zip

# Source Code Pro
https://fonts.google.com/specimen/Source+Code+Pro

# JetBrains Mono
https://www.jetbrains.com/lp/mono/

# Consolas
https://freefontsdownload.net/free-consolas-font-33098.htm

# References
https://www.nerdfonts.com/font-downloads
```

```js

                                               bbbbbbbb
                  lllllll         tttt         b::::::b               999999999          999999999
                  l:::::l      ttt:::t         b::::::b             99:::::::::99      99:::::::::99
                  l:::::l      t:::::t         b::::::b           99:::::::::::::99  99:::::::::::::99
                  l:::::l      t:::::t          b:::::b          9::::::99999::::::99::::::99999::::::9
nnnn  nnnnnnnn     l::::lttttttt:::::ttttttt    b:::::bbbbbbbbb  9:::::9     9:::::99:::::9     9:::::9
n:::nn::::::::nn   l::::lt:::::::::::::::::t    b::::::::::::::bb9:::::9     9:::::99:::::9     9:::::9
n::::::::::::::nn  l::::lt:::::::::::::::::t    b::::::::::::::::b9:::::99999::::::9 9:::::99999::::::9
nn:::::::::::::::n l::::ltttttt:::::::tttttt    b:::::bbbbb:::::::b99::::::::::::::9  99::::::::::::::9
  n:::::nnnn:::::n l::::l      t:::::t          b:::::b    b::::::b  99999::::::::9     99999::::::::9
  n::::n    n::::n l::::l      t:::::t          b:::::b     b:::::b       9::::::9           9::::::9
  n::::n    n::::n l::::l      t:::::t          b:::::b     b:::::b      9::::::9           9::::::9
  n::::n    n::::n l::::l      t:::::t    ttttttb:::::b     b:::::b     9::::::9           9::::::9
  n::::n    n::::nl::::::l     t::::::tttt:::::tb:::::bbbbbb::::::b    9::::::9           9::::::9
  n::::n    n::::nl::::::l     tt::::::::::::::tb::::::::::::::::b    9::::::9           9::::::9
  n::::n    n::::nl::::::l       tt:::::::::::ttb:::::::::::::::b    9::::::9           9::::::9
  nnnnnn    nnnnnnllllllll         ttttttttttt  bbbbbbbbbbbbbbbb    99999999           99999999

```
