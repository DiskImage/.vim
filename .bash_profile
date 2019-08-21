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

#This section adds the directory path and Git branch name into the CLI, to the left.
function parse_git_branch {
      ref=$(git symbolic-ref HEAD 2> /dev/null) || return
            echo "("${ref#refs/heads/}")"
}
PS1="\u@\h \[\033[32m\]\W\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "
#PS1="\w \$(parse_git_branch)\$"
export PS1

alias display_env_vars="grep -rhoE 'process\.env\.([a-zA-Z0-9_\-]+)' ./ --exclude-dir=node_modules | sort -u | sed -E 's/process\.env\.//'"
alias prune_juice="git fetch origin --prune"
alias crotch="git branch -a"
alias salt_n_pepa="git push --follow-tags"
alias gimme_gimme="git pull && npm install && npm update"
alias wat="echo \"I don't even know, bruh...\""
alias thanks="echo \"NP, bruh!\""
alias gut="git"
alias nuke_branches="git branch | grep -v \"master\" | xargs git branch -D"

alias ls="ls -Gh"
alias la="ls -Ghal"

# adds all SSH keys on keychain to the agent every session
ssh-add -A

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function

#eval "$(direnv hook bash)"
