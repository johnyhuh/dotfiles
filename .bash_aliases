# Useful aliases
alias ls='gls $LS_OPTIONS -hF'
alias ll='gls $LS_OPTIONS -lhF'
alias l='gls $LS_OPTIONS -lAhF'
alias g='git'
alias grep='grep --color=auto -in'
alias ..='cd ..'
alias l.='ls -d .*' 2>/dev/null

#OTHER
alias flushdns='sudo discoveryutil udnsflushcaches'
alias removesvn='find . -name .svn -print0 | xargs -0 rm -rf'
alias vmstart='su - jhuh -c "vboxmanage startvm IE --type headless"'
alias vmstop='su - jhuh -c "vboxmanage controlvm IE poweroff"'
alias memstart='sudo memcached -m 16 -l 0.0.0.0 -p 11211 -d -u jhuh'
alias rmqstart='rabbitmq-server -detached'
alias rmqstop='rabbitmqctl stop'

alias mongostart='launchctl load /usr/local/opt/mongodb/homebrew.mxcl.mongodb.plist'
alias mongostop='launchctl unload /usr/local/opt/mongodb/homebrew.mxcl.mongodb.plist'

alias ngstart='sudo nginx'
alias ngstop='sudo nginx -s stop'
alias ngreload='sudo nginx -s reload'
alias fpmstart='php-fpm -D'
alias fpmstop='killall php-fpm'

