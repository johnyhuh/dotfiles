export PATH="/usr/local/bin:/usr/local/sbin:/Applications/Postgres.app/Contents/Versions/9.3/bin:$PATH"
#export XDEBUG_CONFIG="idekey=PHPSTORM remote_host=localhost remote_port=9000"
export XDEBUG_CONFIG="remote_enable=0"
export COMPOSER_PROCESS_TIMEOUT=1200

# Terminal colours (after installing GNU coreutils)
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

NM="\[\033[0;38m\]" #means no background and white lines
IN="\[\033[0m\]"

#export PS1="$NM[ $HI\u $HII\h $SI\w$NM ] $IN"
#export PS1="$NM$HI\u $SI\w$NM $PURPLE\$(git branch 2>/dev/null | grep '^*' | colrm 1 2)$IN: "

export PS1="$NM$Blue\u@\h $BGreen\w$NM$Yellow\$(__git_ps1 \" -[%s]\")$IN\n: "

if [ "$TERM" != "dumb" ]; then
    export LS_OPTIONS='--color=auto'
    eval `gdircolors ~/.dir_colors`
fi

# Aliases
if [ -f ~/.bash_aliases ] ; then source ~/.bash_aliases; fi

# GIT
if [ -f ~/.bash_git ] ; then source ~/.bash_git; fi

