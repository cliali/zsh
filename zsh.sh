#!/bin/bash

# install_zsh="Y"

read -p "Do you want to install Oh My Zsh? (Y/n) " -e -i "y" install_zsh
echo ""

if [[ $install_zsh =~ ^[Yy]$ ]]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
    echo "Oh My Zsh not installed."
fi

read -p "Do you want to install Powerlevel10k theme? (Y/n) " -e -i "y" install_theme
echo ""

if [[ $install_theme =~ ^[Yy]$ ]]; then
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
else
    echo "Powerlevel10k theme not installed."
fi

read -p "Do you want to install zsh-syntax-highlighting plugin? (Y/n) " -e -i "y" install_syntax_highlighting
echo ""

if [[ $install_syntax_highlighting =~ ^[Yy]$ ]]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
else
    echo "zsh-syntax-highlighting not installed."
fi

read -p "Do you want to install zsh-autosuggestions plugin? (Y/n) " -e -i "y" install_autosuggestions
echo ""

if [[ $install_autosuggestions =~ ^[Yy]$ ]]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
else
    echo "zsh-autosuggestions not installed."
fi

read -p "Do you want to update your .zshrc file? This will modify it with the recommended settings. (Y/n) " -e -i "y" zshrc_confirm
echo ""

if [[ $zshrc_confirm =~ ^[Yy]$ ]]; then
    sed -i 's/^ZSH_THEME=.*/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc
    sed -i 's/^plugins=.*/plugins=(git zsh-syntax-highlighting zsh-autosuggestions)/' ~/.zshrc
    echo "Changes made to .zshrc file."
    zsh
    source ~/.zshrc
    echo "Configure your zsh Style: "
    echo "p10k configure"
    p10k configure
else
    echo "Ok then..."
    echo "Change ZSH_THEME='' to ZSH_THEME='powerlevel10k/powerlevel10k'"
    echo "Change plugins(git) to plugins=(git zsh-syntax-highlighting zsh-autosuggestions)"
    echo "in ~/.zshrc file."
    echo "run -> zsh"
    echo "run -> source ~/.zshrc"
    echo "============================"
    echo "Configure your zsh Style: "
    echo "p10k configure"
fi


