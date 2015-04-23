#------- Editing of .profile file and refresh command -----------
alias profile='vim ~/.profile && source ~/.profile'
alias aliases='vim ~/.bash_aliases && source ~/.bash_aliases'
alias :r='source ~/.bashrc'
alias dotfiles='cd ~/dotfiles'
#----------------------------------------------------------------

#------- Vim Commands -------------------------------------------
alias :q='exit'
#----------------------------------------------------------------

#------- Ruby ---------------------------------------------------
alias be='bundle exec'
alias bi='bundle install'
alias ctags-ruby-bundle='ctags -R --languages=ruby --exclude=.git --exclude=log $(bundle list --paths) .'
alias diffocop="git diff origin/dev --name-only --diff-filter=ACMRTUXB | grep '\.rb$' | tr '\n' ' ' | xargs rubocop"
#----------------------------------------------------------------

#------- Git Aliases --------------------------------------------
alias git-init='git init && echo ".DS_Store" > .gitignore'
alias gs='git status'
alias ga='git add -A'
alias gca='git commit --amend'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gac='git add -A :/ && git commit -a'
alias gd='git diff'
alias gb='git branch'
alias gp='git push'
#----------------------------------------------------------------

#------- Utilities ----------------------------------------------
alias ll='ls -lh'
alias listpath='echo $PATH | tr ":" "\n"'
alias tmux='tmux -2' # colors!!!
alias twoup='lpr -o number-up=2 -o page-border=single'
alias mocha='mocha --compilers coffee:coffee-script/register'
alias ar='cd $(get-app-root)'
#----------------------------------------------------------------

#------  Work folder access -------------------------------------
alias projects='cd /Users/lawrencejones/Projects'
alias sesquis='cd /Users/lawrencejones/Projects/sesquis'
alias journal='cd /Users/lawrencejones/Projects/journal'
#----------------------------------------------------------------

#------- PostgreSQL ---------------------------------------------
alias pg-start='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pg-stop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'
#----------------------------------------------------------------

#------- Imperial Aliases ---------------------------------------
alias cate-token="git log | head -1 | awk -F' ' '{ print \$NF }' > ~/cate_token.txt"
#----------------------------------------------------------------
