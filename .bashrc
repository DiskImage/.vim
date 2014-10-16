# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions

function parse_git_branch {
      ref=$(git symbolic-ref HEAD 2> /dev/null) || return
            echo "("${ref#refs/heads/}")"
}
PS1="\w \$(parse_git_branch)\$"
export PS1


#Aliases for great justice.
#alias sapp='cd ~/sandbox/app/'
#alias wtfh='cd ~/sandbox/app/log/ && tail -f debug_log error_log'
alias killitwithfire='git reset --hard'
alias KillItWithFire='git reset --hard'
alias KILLITWITHFIRE='git reset --hard'
alias nukeitfromorbit='git reset --hard'
alias NukeItFromOrbit='git reset --hard'
alias NUKEITFROMORBIT='git reset --hard'


#Functions: NEWbz
function git_update_with_master() {
    git fetch origin
    git checkout master
    git merge origin/master
    git checkout $1
    git rebase master
}
function git_apply_changes_from_X_to_Y() {
    git fetch origin
    git checkout $1
    git merge origin/$1
    git checkout $2
    git rebase $1
}





SSH_ENV=$HOME/.ssh/environment
   
# start the ssh-agent
function start_agent {
        echo "Initializing new SSH agent..."
        # spawn ssh-agent
        /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
        echo succeeded
        chmod 600 "${SSH_ENV}"
        . "${SSH_ENV}" > /dev/null
        /usr/bin/ssh-add
}
   
if [ -f "${SSH_ENV}" ]; then
     . "${SSH_ENV}" > /dev/null
      ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
          start_agent;
      }
else
    start_agent;
fi

#Path variable declarations
PATH=/usr/local/bin:/usr/bin:~/bin
