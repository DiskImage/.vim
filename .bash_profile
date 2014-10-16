SSHAGENT=/usr/bin/ssh-agent
SSHAGENTARGS="-s"
if [ -z "$SSH_AUTH_SOCK" -a -x "$SSHAGENT" ]; then
    eval `$SSHAGENT $SSHAGENTARGS`
    trap "kill $SSH_AGENT_PID" 0
fi

alias mongodb_dir="cd /cygdrive/c/development/mongodb"

gorram() {
    if [[ $@ == "changes" ]]; then command git reset --hard; else command ls "$@"; fi; }

#Path variable declarations
PATH=/usr/local/bin:/usr/bin:~/bin
