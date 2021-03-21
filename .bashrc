# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions


# Bash prompt modification 
# Source : zessx - https://gist.github.com/zessx/10777a44ff56304487e7970142ca0b65
BRANCH_SAFE=("develop", "dev")
BRANCH_UNSAFE=("main")
USER_UNSAFE=("root", "git")

function in_array() {
    local e
    for e in "${@:2}"; do [[ "$e" == "$1" ]] && return 0; done
    return 1
}

function prompt() {
    # Define colors
    local RED="\[\e[1;31m\]"
    local YELLOW="\[\e[1;33m\]"
    local GREEN="\[\e[1;32m\]"
    local RESET="\[$(tput sgr0)\]"

    # Set up user
    local USER=$(whoami)
    local USER_PS="$GREEN\u$RESET"
    if in_array "${USER}" "${USER_UNSAFE[@]}"; then
	    USER_PS="$RED\u$RESET"
    fi

    # Get git branch
    local GIT_BRANCH=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
    local GIT_BRANCH_PS=" $YELLOW($GIT_BRANCH)$RESET$GIT_STATUS_PS"
    if in_array "${GIT_BRANCH}" "${BRANCH_SAFE[@]}"; then
        GIT_BRANCH_PS=" $GREEN($GIT_BRANCH)$RESET$GIT_STATUS_PS"
    elif in_array "${GIT_BRANCH}" "${BRANCH_UNSAFE[@]}"; then
        GIT_BRANCH_PS=" $RED($GIT_BRANCH)$RESET$GIT_STATUS_PS"
    elif [[ "" == "$GIT_BRANCH" ]]; then
        GIT_BRANCH_PS=""
    fi

    PS1="${USER_PS} ${YELLOW}\w${RESET}${GIT_BRANCH_PS} \\$ "
}


alias vi="vim"
PROMPT_COMMAND=prompt
export EDITOR=/usr/bin/vim
