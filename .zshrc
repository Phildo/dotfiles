#!/bin/zsh

if [[ ! -e ~/.zshrc_port ]]; then
  ~/dotfiles/port_zshrc.sh
fi

. ~/.zshrc_port

