#!/usr/bin/env bash

BASEDIR=$(dirname $0)

pushd $BASEDIR

packages=(
    neovim
    stow
    zsh
    tmux
    git
)

# Required packages
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    if cat /etc/*release | grep ^NAME | grep CentOS; then
        yum install -y $packages
    else
        apt update
        apt install -y $packages
    fi
elif [[ "$OSTYPE" == "darwin"* ]]; then
    brew install $packages
else
    echo "OS NOT SUPPORTED: $OSTYPE"
    popd
    exit 1;
fi

# Oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Powerlevel 10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

bash setup

popd