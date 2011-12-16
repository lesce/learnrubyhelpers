export PATH=/usr/local/sbin:/usr/local/bin:/usr/local/mysql/bin:$PATH
# Prompt 
BLACK="%{"$'\033[01;30m'"%}"
GREEN="%{"$'\033[01;32m'"%}"
RED="%{"$'\033[01;31m'"%}"
YELLOW="%{"$'\033[01;33m'"%}"
BLUE="%{"$'\033[01;34m'"%}"
BOLD="%{"$'\033[01;39m'"%}"
NORM="%{"$'\033[00m'"%}"

#export PROMPT="%n@%m %c %# "
export PS1="${BLUE}%~ ${BOLD}%# ${NORM}"

alias ls="ls -G"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # This loads RVM into a shell session.
