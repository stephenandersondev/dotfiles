
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Imagemagick
export PKG_CONFIG_PATH="/usr/local/opt/imagemagick@6/lib/pkgconfig:$PKG_CONFIG_PATH"

# Editor Settings
export EDITOR="code"
export BUNDLER_EDITOR="code"

# Postgres.app
export PGDATA='/Users/stephen/Library/Application Support/Postgres/var-12'
export PATH="/Applications/Postgres.app/Contents/Versions/12/bin:$PATH"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
export PATH="$PATH:$HOME/.rvm/bin"

# General Aliases
alias tailrd="tail -f log/development.log"
alias tailrt="tail -f log/test.log"
alias tailrs="tail -f log/sidekiq.log"
alias fs="foreman start -f Procfile.dev"
alias rc="rails c"
alias rdbm="rails db:migrate"
alias karma="rake karma:start"

# Helper for tailing logs on a Heroku review app
htl() {
  heroku logs --tail --app $1
}

# Helper for running rails c on a Heroku review app
hrc() {
 heroku run --app=$1 rails c
}

# Hide "The default interactive shell is now zsh." message.
export BASH_SILENCE_DEPRECATION_WARNING=1

# Custom bash prompt
PS1='\[\e[0;1;32m\]\u\[\e[0m\]:\[\e[0;1;38;5;32m\]\W\[\e[0m\]-\[\e[0m\]>\[\e[0;1;91m\]$(git branch 2>/dev/null | grep '"'"'^*'"'"' | colrm 1 2)\[\e[0m\]$\[\e[0m\] '

# https://stackoverflow.com/questions/50168647/multiprocessing-causes-python-to-crash-and-gives-an-error-may-have-been-in-progr
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES