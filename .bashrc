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

# minimal ls with dates edited
lst()
{
  ls -l "$@" | awk '!/^total/ { printf "%-20s %3s %2d %8s\n", $9, $6, $7, $8 }'
}

# verifies '!' shell expansion before execution
shopt -s histverify

# recursive grep that ignores case and doesn't search directories you probably didn't want to search
alias gr="grep -Iir --exclude-dir={.git,.AppleDouble}"

# runs makefile for project in current directory (requires amake)
alias mr="amake run"
# runs test makefile for project in current directory (requires amake)
alias mt="amake test"

# quick ssh shortcuts
alias dev="ssh pdougherty@dev.arisgames.org"
alias prod="ssh pdougherty@methane.arisgames.org"
alias phildo="ssh phildo@phildogames.com"

# ARIS work shortcuts
ARIS="~/Desktop/iOSClient/ARIS.xcworkspace"
alias aris="open ~/Desktop/iOSClient/ARIS.xcworkspace"
alias cdaris="cd ~/Desktop/iOSClient"

