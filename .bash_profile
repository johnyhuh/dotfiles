# Prompt
#if [ -f ~/.bash_prompt] ; then source ~/.bash_prompt; fi
# Terminal colors (after installing GNU coreutils)

# Regular Colors
Black='\e[0;30m'        # Black
Red='\e[0;31m'          # Red
Green='\e[0;32m'        # Green
Yellow='\e[0;33m'       # Yellow
Blue='\e[0;34m'         # Blue
Purple='\e[0;35m'       # Purple
Cyan='\e[0;36m'         # Cyan
White='\e[0;37m'        # White

# Bold
BBlack='\e[1;30m'       # Black
BRed='\e[1;31m'         # Red
BGreen='\e[1;32m'       # Green
BYellow='\e[1;33m'      # Yellow
BBlue='\e[1;34m'        # Blue
BPurple='\e[1;35m'      # Purple
BCyan='\e[1;36m'        # Cyan
BWhite='\e[1;37m'       # White

NM="\[\033[0;38m\]"     # no background and white lines
IN="\[\033[0m\]"

#export PS1="$NM[ $HI\u $HII\h $SI\w$NM ] $IN"
#export PS1="$NM$BWhite\u $Yellow\w$NM $BGreen\$(parse_git_branch)$BRed*$IN: "
export PS1="$NM$Cyan\u $BGreen\w$NM$Yellow\$(__git_ps1 \" -[%s]\")$IN\n: "

if [ "$TERM" != "dumb" ]; then
    export LS_OPTIONS='--color=auto'
    eval `gdircolors ~/.dir_colors`
fi

# Aliases
if [ -f ~/.bash_aliases ] ; then source ~/.bash_aliases; fi

# GIT
if [ -f ~/.bash_git ] ; then source ~/.bash_git; fi

export PATH="/usr/local/sbin:$PATH"
export PTOOLSPATH=/usr/local/opt/phalcon-devtools/
export PATH=$PATH:/usr/local/opt/phalcon-devtools

if [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi
