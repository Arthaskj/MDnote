#!/usr//bin/expect 
set pwd  19951026

#spawn cd ~/workspace/MarkDown
spawn git pull
expect "*assword" {send "$pwd\r"}
spawn git add .
spawn git commit -m "From Mac 12'"
spawn git push
expect "*assword" {send "$pwd\r"}
interact
