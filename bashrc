#!/bin/sh

### PATH CONFIGURATION #########################################################

# Secondary paths (desc importance) ##############

PATH=$PATH:/usr/X11R6/bin:/usr/local/sbin  # X11 configuration on mac
PATH=$PATH:/usr/local/CrossPack-AVR/bin  # Add avr toolchain
PATH=$PATH:/usr/local/sicstus4.2.3/bin  # Add prolog binary for sicstus
PATH=$PATH:/usr/local/i386-elf-gcc/bin  # Pintos i386-elf toolchain
PATH=$PATH:$HOME/.vim/bundle/selecta  # Add selecta to path for vim

### SOURCE PACKAGE MANAGERS (RBENV, NVM) #######################################

# Load NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Add npm locations to path if node exists
if [ -n "$(node --version 2>/dev/null)" ]; then
  export NODE_PATH="/usr/local/lib/node_modules:/usr/local/lib/node:$NODE_PATH"
  export PATH="/usr/local/share/npm/bin:$PATH"
  export PATH="/usr/local/bin/npm:$PATH"
fi

# Configure rbenv
export PATH="/Users/lawrencejones/.rbenv/shims:${PATH}"
source "/usr/local/Cellar/rbenv/0.4.0/libexec/../completions/rbenv.bash"
rbenv rehash 2>/dev/null
rbenv() {
  typeset command
  command="$1"
  if [ "$#" -gt 0 ]; then
    shift
  fi

  case "$command" in
  rehash|shell)
    eval `rbenv "sh-$command" "$@"`;;
  *)
    command rbenv "$command" "$@";;
  esac
}

### SELECT GNU COMMANDS ########################################################

# For those commands that require a g prefix, select if exist
cmds="ls grep find dircolors sed"
for cmd in $cmds
do
  $(which g$cmd >/dev/null 2>/dev/null) && alias $cmd="g$cmd"
done

# Enable spell checking for commands
shopt -s cdspell

### CONFIGURE TERMINAL COLORS ##################################################

# Set the ls folder and file color support
export CLICOLOR=1
export   CLRCOL=$'\e[0m'

# Set the theme name
export theme="molokai"  # keep theme choices up to date
source ~/.colors/colors.$theme

# Set terminal to color on
force_color_prompt=yes
# Double check color support#
if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
  color_prompt=yes
    else
  color_prompt=
    fi
fi

### CONFIGURE LS AND GREP ######################################################

# Alias ls colors if supported
$(ls --color=always &>/dev/null) && alias ls='ls --color=always'

# If supported, then run dircolors
if [[ $(dircolors 2>/dev/null) ]];
then
  $(gls --color=always &>/dev/null) && alias ls='gls --color=always'
  test -r ~/.dircolors/dircolors.$theme &&
    eval "$(dircolors -b ~/.dircolors/dircolors.$theme &>/dev/null)" || eval "$(dircolors -b)"
else
  # Default ls and colors
  export LSCOLORS=GxFxCxDxBxegedabagaced
fi

# If we have gnu-grep
$(which ggrep &>/dev/null) && alias grep='ggrep --color=auto'

# Force color output in tree
alias tree='tree -C'

### SOURCE ANY EXTERNAL SCRIPTS ################################################

# If brew is installed, and bash completion found, then load it!
$(brew --prefix &>/dev/null) &&
  if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
  fi

### LOCAL REPO DETECTION #######################################################

# Priority paths (ascd importance)
PATH=./bin:$PATH  # current path
PATH=/usr/local/bin:$PATH  # brew path

cd() {
  builtin cd "$@" && {
    [ -e dev ] && source dev
  }
}

# Configure environment
source ~/.shared_env
[ -f ~/.env ] && source ~/.env

# GC env
source ~/.gocardless

# Bash specific
source ~/.bash_helpers.sh
source ~/.bash_ps1
source ~/.bash_aliases

export PATH=./bin:$PATH
