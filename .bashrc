#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Defined by me
###############

# Coloured man
man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "$@"
}


alias ls='ls --color=auto'
alias grep='grep --colou=auto'
#PS1='[\u@\h \W]\$ '
PS1="\[\e[1;31m\][\[\e[1;32m\]\u\[\e[1;35m\]@\[\e[1;32m\]\h\[\e[1;31m\]:\[\e[1;34m\]\w\[\e[1;31m\]]\[\e[0m\]\$ "

# show system info after terminal starts
# screenfetch

# Use ssh agent
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent > ~/.ssh-agent-thing
fi
if [[ "$SSH_AGENT_PID" == "" ]]; then
    eval "$(<~/.ssh-agent-thing)"
fi
