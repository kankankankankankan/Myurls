#!/bin/sh
sed -i "s#http://example.com#https://$DOMAIN#g" ./public/index.html
sed -i '7s/MyUrls/URLS/' ./public/index.html
sed -i 's/unpkg.com/unpkg.zhimg.com/g' ./public/index.html
sed -i '22s|<img width="300" src="https:\/\/cdn.jsdelivr.net\/gh\/CareyWang\/MyUrls@master\/public\/logo.png" @click="goToGayHub">|<img width="250" src="https:\/\/cdn.jsdelivr.net\/gh\/kankankankankankan\/Myurls-Railway@master\/public\/logo.png"\/>|' ./public/index.html
sed -i '23s/@keyup.enter.native="enterToDoShort"/@keyup.enter.native="enterToDoShort" placeholder="请输入转换链接"/' ./public/index.html
./linux-amd64-myurls.service -domain $DOMAIN -conn $RDSHOST:$RDSPORT -passwd $RDSPASSWORD -ttl $TTL &
nginx -g 'daemon off;'
