# Install necessary programms
```bash
sudo apt -y install curl zsh stow neovim git fzf bat
``````

# make zsh the default shell
```bahs
sudo chsh -s $(which zsh) $(whoami)
```

# install oh my zsh
```bash
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

# install plug manager for nvim
```bash
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

# get dot files
```bash
cd ~ && git clone https://github.com/steventreske/dotfiles.git
```

# clean unnecessary created dotfiles
```bash
rm ~/.zshrc
rm -rf ~/.oh-my-zsh/custom
```

# create sys links for the dot files
```bash
cd dotfiles
stow --verbose --target=$HOME --restow neovim
stow --verbose --target=$HOME --restow zsh
stow --verbose --target=$HOME --restow ohmyzsh
stow --verbose --target=$HOME --restow p10k
```

# create install zsh plugins
```bash
git clone https://github.com/Aloxaf/fzf-tab ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```
