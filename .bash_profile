source ~/.login
source ~/.logout


SSHAGENT=`which ssh-agent`
SSHAGENTARGS="-s"
if [ -z "$SSH_AUTH_SOCK" -a -x "$SSHAGENT" ]; then
    eval `$SSHAGENT $SSHAGENTARGS`
    trap "kill $SSH_AGENT_PID" 0
fi

source ~/git-completion.bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

#Path variable declarations
#PATH=/usr/local/bin:/usr/bin:~/bin

# for running locally
for f in ~/local-config/*.sh; do source $f; done


#This section adds the directory path and Git branch name into the CLI, to the left.
function parse_git_branch {
      ref=$(git symbolic-ref HEAD 2> /dev/null) || return
            echo "("${ref#refs/heads/}")"
}
PS1="\u@\h \[\033[32m\]\W\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "
#PS1="\w \$(parse_git_branch)\$"
export PS1


terminate_core(){
  lsof -P | grep ':3000' | awk '{print $2}' | xargs kill -9
}

#Turn on akitabot in CLI mode
alias akitabot="coffee ~/akitabox/akitabot/node_modules/.bin/hubot"
alias prune_juice="git fetch origin --prune"
alias crotch="git branch -a"
alias salt_n_pepa="git push --follow-tags"
alias gimme_gimme="git pull && npm install && npm update"
alias burn_baby_burn="SETUP=1 node .tmp/app.js"
alias wat="echo \"I don't even know, bruh...\""
alias thanks="echo \"NP, bruh!\""
alias cz="rm -f .git/hooks/pre-commit && git cz"
alias gut="git"
alias npm_global_links="npm list -g --link --depth=0"
alias npm_local_links="find node_modules/\@akitabox/ -type l -ls && npm ls --link --depth=0"

alias sage_tunnel="echo 'Should set up an SSH Tunnel'"
alias do_the_thing="cd ~/akitabox/ && lerna run start --parallel"

alias ls="ls -Gh"
alias la="ls -Ghal"

export NODE_ENV=local

# adds all SSH keys on keychain to the agent every session
ssh-add -A

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
