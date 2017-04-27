# Useful aliases
alias ls='gls $LS_OPTIONS -hF'
alias ll='gls $LS_OPTIONS -lhF'
alias l='gls $LS_OPTIONS -lAhF'
alias g='git'
alias grep='grep --color=auto -in'
alias ..='cd ..'
alias l.='ls -d .*' 2>/dev/null

#Illuminate
alias vcd='cd /Volumes/server-local/Illuminate/dev-vagrant'
alias vu='cd /Volumes/server-local/Illuminate/dev-vagrant && vagrant up'

#OTHER
alias flushdns='sudo killall -HUP mDNSResponder'

#SERVICES
alias redstart='launchctl load /usr/local/opt/redis/homebrew.mxcl.redis.plist'
alias redstop='launchctl unload /usr/local/opt/redis/homebrew.mxcl.redis.plist'
alias ngstart='sudo nginx'
alias ngstop='sudo nginx -s stop'
alias ngreload='sudo nginx -s reload'
alias fpmstart='php-fpm -D'
alias fpmstop='killall php-fpm'
alias dub='docker-compose up --build'
