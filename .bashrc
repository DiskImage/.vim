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
alias sapp='cd ~/sandbox/app/'
alias wtfh='cd ~/sandbox/app/log/ && tail -f debug_log error_log'


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
