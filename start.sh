#!/bin/bash
service ssh start
ngrok config add-authtoken $token
FILE=/run.sh
if test -f "$FILE"; then
    chmod +x /run.sh
    nohup /run.sh & > /home/log
fi
ngrok tcp 22 --log=stdout > ngrok.log