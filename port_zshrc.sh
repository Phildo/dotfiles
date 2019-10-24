#!/bin/zsh

cat .bashrc | sed s/bash/zsh/g | grep -v shopt > ~/.zshrc_port
echo "PROMPT='%1d $ '" >> ~/.zshrc_port

