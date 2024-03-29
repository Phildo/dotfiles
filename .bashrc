[[ -r /etc/bashrc ]] && . /etc/bashrc

PHILDOSCRIPTS="/usr/local/bin/phildoscripts"
alias phildoscripts="cd $PHILDOSCRIPTS"

#put /usr/local/bin before /usr/bin (already in PATH) for brew stuff
export PATH="/usr/local/bin:/usr/local/sbin:$PATH:$PHILDOSCRIPTS:$PHILDOSCRIPTS/other"
export PS1="\W \$ "

# when using vim to open one file that ends in "." (and no such file exists, but files with that prefix DO),
# it automatically assumes that you intended to open the files with that prefix, but tab-completion cut you short.
vim()
{
  if [ $# -eq 1 ] && [ ! -f ${1} ]; then
    if [[ ${1} =~ \.$ ]] && ls ${1}* > /dev/null 2>&1; then
     command vim ${1}*
    elif ls ${1}\.* > /dev/null 2>&1; then
     command vim ${1}*
    else
      command vim "$@"
    fi
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

# use grep to open all files containing text (duplicates gr logic)
vg()
{
  vim `grep -Ilir --exclude=tags --exclude-dir={.git,.AppleDouble} "$@" . | xargs`
}
vcsg()
{
  vim `grep -Ilr --exclude=tags --exclude-dir={.git,.AppleDouble} "$@" . | xargs`
}

# i often accidentally a space before the 't' (ex: "gi tstatus")
gi()
{
  git `echo "$@" | sed 's/^t//'`
}

alias ls="ls -G"

# minimal ls with dates edited
lst()
{
  ls -l "$@" | awk '!/^total/ { printf "%-30s %3s %2d %8s\n", $9, $6, $7, $8 }'
}

# recursive ls with maxdepth
lsr()
{
  if [ $# -eq 1 ]; then
    find $1
  elif [ $# -eq 2 ]; then
    find $1 -maxdepth $2
  else
    find .
  fi
}

#strip out useful ip addresses from ifconfig
ip()
{
  ifconfig | egrep '\d\d?\d?\.\d\d?\d?\.\d\d?\d?\.\d\d?\d?' | awk '{ print $2 }'
}

# draw a line across the terminal (clearly shows beginning of next command without clearing history)
line()
{
  i=`tput cols`;
  while [ $i -gt 1 ]; do echo -n '-'; i=$(($i-1)); done
  echo '-'
}

awkrmdups()
{
  awk '!seen[$0]++' $2 > $1
}

# verifies '!' shell expansion before execution
shopt -s histverify

# recursive grep that ignores case and doesn't search directories you probably didn't want to search
alias csgr="grep -Ir --exclude=tags --exclude-dir={.git,.AppleDouble}"
alias gr="grep -Iir --exclude=scriptmn.js --exclude=tags --exclude-dir={.git,.AppleDouble}"
alias gdb="gdb -q"

# quickly create server running in background
#[n]ohup [py]thon [s]erver [s]ilent
alias pys="python -m SimpleHTTPServer &"
alias pyss="python -m SimpleHTTPServer >/dev/null 2>&1 &"
alias npys="nohup python -m SimpleHTTPServer &"
alias npyss="nohup python -m SimpleHTTPServer >/dev/null 2>&1 &"

# quick ssh shortcuts
alias phildo="ssh phildo@phildogames.com"
alias personal="ssh phildo@phildopersonal.com"

stash()
{
  scp $1 phildo@phildogames.com:~/stash/
}
stashr()
{
  scp -r $1 phildo@phildogames.com:~/stash/
}
snatch()
{
  scp phildo@phildogames.com:~/stash/$1 .
}
snatchr()
{
  scp -r phildo@phildogames.com:~/stash/$1 .
}
scratch()
{
  scp $1 phildo@phildogames.com:/var/www/html/phildogames/scratch/
}
scratchr()
{
  scp -r $1 phildo@phildogames.com:/var/www/html/phildogames/scratch/
}

timestamp()
{
  #date | sed -e 's/ //g' -e 's/://g'
  date +"%Y%m%d%H%M%S"
}

alias cddesk="cd ~/Desktop"
alias todo="vim ~/.todo"

# for r2l (route 2 local) (github.com/Phildos/r2l)
R2L_NAMES="reddit.com,twitter.com,api.twitter.com,twimg.com,abs.twimg.com,pbs.twimg.com,imgur.com"
alias block="sudo R2L_NAMES=$R2L_NAMES r2l -e"
alias unblock="sudo r2l -u"

export EDITOR="vim"

alias tmuxn="tmux new -s do"
alias tmuxa="tmux attach -t do"
alias mux="tmuxn || tmuxa"

[[ -r ~/.bashrc_native ]] && . ~/.bashrc_native
[[ -r ~/.bashrc_local ]] && . ~/.bashrc_local
