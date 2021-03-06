#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#=========================================================================
# Defined by me
#=========================================================================

export EDITOR=vim

export COLOR_NC='\e[0m' # No Color
export COLOR_WHITE='\e[1;37m'
export COLOR_BLACK='\e[0;30m'
export COLOR_BLUE='\e[0;34m'
export COLOR_LIGHT_BLUE='\e[1;34m'
export COLOR_GREEN='\e[0;32m'
export COLOR_LIGHT_GREEN='\e[1;32m'
export COLOR_CYAN='\e[0;36m'
export COLOR_LIGHT_CYAN='\e[1;36m'
export COLOR_RED='\e[0;31m'
export COLOR_LIGHT_RED='\e[1;31m'
export COLOR_PURPLE='\e[0;35m'
export COLOR_LIGHT_PURPLE='\e[1;35m'
export COLOR_BROWN='\e[0;33m'
export COLOR_YELLOW='\e[1;33m'
export COLOR_GRAY='\e[0;30m'
export COLOR_LIGHT_GRAY='\e[0;37m'

PS1="\[\e[1;31m\][\[\e[1;32m\]\u\[\e[1;31m\]@\[\e[0;32m\]\h\[\e[1;31m\]:\[\e[1;34m\]\w\[\e[1;31m\]]\[\e[1;32m\]\\$\[\e[0m\] "

# Set dircolors
eval "$(dircolors /etc/DIR_COLORS)"

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



#-------------------------------------------------------------
# Aliases and functions
#-------------------------------------------------------------

alias ls='ls --color=auto'
alias grep='grep --colou=auto'
alias prettyjson='python -m json.tool'
alias less='less -Mi'

# Connect to a host WITHOUT authenticity check and WITHOUT adding its
# IP address to the ~/.ssh/known_hosts
alias sssh='ssh -o "UserKnownHostsFile /dev/null" -o "StrictHostKeyChecking no"'

# Select screenshot and put it to a selection CLIPBOARD
alias take_screenshot='maim -s | xclip -selection clipboard -t image/png'

#-----------------
# Docker commands
#-----------------

# execute container in current shell
function docexec {
    docker exec -it $1 bash
}

# remove images without a name (<none>)
function docrmi {
    docker rmi $(docker images | grep '<none>' | awk '{ print $3 }')
}



# Shared folder
windows_SHARE="$HOME/VirtualBox_share/windows10/"

# Use ssh agent
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent > ~/.ssh-agent-thing
fi
if [[ "$SSH_AGENT_PID" == "" ]]; then
    eval "$(<~/.ssh-agent-thing)"
fi



#=========================================================================
# ssh commands:
#=========================================================================

## Generate new ssh key pair
## https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/
# ssh-keygen -t rsa -b 4096 -C "your_email@example.com"

## Print an OpenSSH public key to stdout from PEM private key
# ssh-keygen -y -f key.pem

## Print fingerprint from public or private key using SHA256 hash
# ssh-keygen -l -f key (key.pub)
#     4096 SHA256:ECzbwYZnzzdfyMFa26T0IEUJd86segPC4NB1Q7R/kt4 no comment (RSA)

## Print fingerprint from public or private key using MD5 hash
# ssh-keygen -l -E md5 -f key.pub
#     4096 MD5:f1:6e:c2:4f:8e:af:5a:3f:19:c0:f0:c2:d2:ca:92:ee no comment (RSA)

## Export key to other formats
# ssh-keygen -e -f unix -m [RFC4716 | PKCS8 | PEM]
#     RFC4716 (defalt) - RFC 4716/SSH2 public or private key
#     PKCS8 - PEM PKCS8 public key
#     PEM - PEM public key

## Decrypt encrypted .PEM key
# openssl rsa -in enc.key [-out dec.key]

## Generate self-signed certificate
## https://stackoverflow.com/a/10176685
# openssl req -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -days 365 [-nodes]
#     -nodes (optional): create certificate without password


#=========================================================================
# other commands
#=========================================================================

# xev - show keyboard pressed keys
# xprop - show information about X client (window)

# Generate strong password 15 characters long
# pwgen -cnsy 15 1
    # -c, --capitalize
    #        Don't bother to include any capital letters in the generated passwords.
    #
    # -n, --numerals
    #        Include at least one number in the password.  This is the default if the standard output is a tty device.
    #
    # -s, --secure
    #        Generate  completely random, hard-to-memorize passwords.  These should
    #        only be used for machine passwords, since otherwise it's almost
    #        guaranteed that users will simply write the password on a piece of paper
    #        taped to the monitor...
    #
    # -y, --symbols
    #        Include at least one special character in the password.
