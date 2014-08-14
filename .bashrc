# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# when using vim to open one file that ends in "." (and no such file exists, but files with that prefix DO), 
# it automatically assumes that you intended to open the files with that prefix, but tab-completion cut you short.
vim()
{
  if [ $# -eq 1 ] && [[ ${1} =~ \.$ ]] && [ ! -f ${1} ] && ls ${1}* > /dev/null 2>&1; then
    command vim ${1}*
  else
    command vim "$@"
  fi
}

# use selecta to select file to open with vim
vs()
{
  if [ $# -eq 1 ]; then
    command vim $1/$(ls $1 | selecta)
  else
    command vim $(ls | selecta)
  fi
}

alias ls="ls -G"
# minimal ls with dates edited
lst()
{
  ls -l "$@" | awk '!/^total/ { printf "%-30s %3s %2d %8s\n", $9, $6, $7, $8 }'
}

# verifies '!' shell expansion before execution
shopt -s histverify

# draw a line across the terminal (clearly shows beginning of next command without clearing history)
line()
{
  i=`tput cols`;
  while [ $i -gt 1 ]; do echo -n '-'; i=$(($i-1)); done
  echo '-'
}

# recursive grep that ignores case and doesn't search directories you probably didn't want to search
alias gr="grep -Iir --exclude-dir={.git,.AppleDouble}"
alias gdb="gdb -q"

alias v="vim"
alias c="clear"

# runs makefile for project in current directory (requires amake)
alias mg="amake go"
# runs test makefile for project in current directory (requires amake)
alias mt="amake test"

# quickly create server running in background
alias pys="python -m SimpleHTTPServer &"
alias npys="nohup python -m SimpleHTTPServer &"

# quick ssh shortcuts
alias dev="ssh pdougherty@dev.arisgames.org"
alias prod="ssh pdougherty@methane.arisgames.org"
alias phildo="ssh phildo@phildogames.com"

# ARIS work shortcuts
ARIS="~/Desktop/iOSClient/ARIS.xcworkspace"
alias aris="open ~/Desktop/iOSClient/ARIS.xcworkspace"
alias cdaris="cd ~/Desktop/iOSClient"

FLAT="~/Desktop/flat"
alias cdflat="cd $FLAT"

WTL="~/Desktop/win-the-lottery"
alias cdwtl="cd $WTL"

# for r2l (route 2 local) (github.com/Phildos/r2l)
R2L_NAMES="facebook.com,news.ycombinator.com,reddit.com,twitter.com,youtube.com"
alias block="sudo R2L_NAMES=$R2L_NAMES r2l -e"
alias unblock="sudo r2l -u"

# Android dev (this is obnoxious)
export ANDROID_SDK="/Developer/android-sdk"
export ANDROID_NDK="/Developer/android-ndk"
export ANDROID_MOTO="/Developer/moto"
export PATH="$PATH:$ANDROID_SDK/tools:$ANDROID_SDK/platform-tools:$ANDROID_NDK:$ANDROID_MOTO"
