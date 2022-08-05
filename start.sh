#!/bin/bash
#!！
rm -f filebrowser.db
nohup filebrowser -r /  -p 9184 >> /dev/null 2>&1 & 

#nohup ./FolderMagic  -auth admin:$Aria2_secret -bind :9184  >> /dev/null 2>&1 & 

rm -rf /bot
git clone https://github.com/winkxx/exli-bot.git
chmod 0777 /exli-bot
mkdir /bot/
chmod 0777 /bot
mv /exli-bot/root/* /bot/

rm /etc/nginx/nginx.conf
cp /exli-bot/root/nginx.conf /etc/nginx/

rm -rf /exli-bot

python3 /bot/nginx.py
nginx -c /etc/nginx/nginx.conf
nginx -s reload

# nohup aria2c --conf-path=/root/.aria2/aria2.conf --rpc-listen-port=8080 --rpc-secret=$Aria2_secret &
# nohup rclone rcd --rc-addr=127.0.0.1:5572 --rc-user=root --rc-pass=$Aria2_secret --rc-allow-origin="https://elonh.github.io" &
#nohup python3 /bot/web.py &

# python3 /bot/main.py
#nohup bgmi_http --port=8868 --address=0.0.0.0  &
nohup /bot/exloli &
