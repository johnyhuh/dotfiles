# SCP
## Local to remote
`scp -P 22 -r -p -C /local/local_dir/. remote_username@remote_hostname:/remote/remote_dir`

## Remote to local
`scp -P 22 -r remote_username@remote_hostname:/remote/remote_dir /local/local_dir`

# Mac Keyboard repeat
`defaults write -g ApplePressAndHoldEnabled -bool false`

# Switch PHP to 5.6
`brew unlink php && brew link --overwrite --force php@5.6`
