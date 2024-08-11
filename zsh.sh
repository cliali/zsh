#!/bin/bash

missing_tools=""

if ! command -v curl &> /dev/null; then
  missing_tools="$missing_tools curl"
fi

if ! command -v git &> /dev/null; then
  missing_tools="$missing_tools git"
fi

if ! command -v zsh &> /dev/null; then
  missing_tools="$missing_tools zsh"
fi

if [ -n "$missing_tools" ]; then
  echo "Error: The following tools are required but not installed:"
  echo -e "\t* $missing_tools"
  exit 1
fi


rm -rf ~/.oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions


sed -i 's/^ZSH_THEME=.*/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc
sed -i 's/^plugins=.*/plugins=(git zsh-syntax-highlighting zsh-autosuggestions)/' ~/.zshrc

if [ "SHELL" != "/bin/zsh" ]; then
  zsh
fi

source ~/.zshrc
p10k configure
