#!/bin/bash
JSESSIONID=${1}
ID=${2}
COOKIE="JSESSIONID=$JSESSIONID; SERVERID=web-172-0-52"
echo "$(date +"%Y%m%dT%H:%M:%S%z") SendSale $ID "
LOG_FILE="send_sale_${ID}.log"

curl -s "https://pay.7-eleven.com.ph/transaction/index/$ID" \
 -H 'Content-Type: application/x-www-form-urlencoded' \
 -b "$COOKIE" \
 -H 'Origin: https://pay.7-eleven.com.ph' \
 -H "Referer: https://pay.7-eleven.com.ph/transaction/show/$ID" \
 -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36 Edg/136.0.0.0' \
 --data-raw '_action_sendSaleAdvicePAID=Send+Sale+Advice' \
 -v > "$LOG_FILE" 2>&1


#response_code=$(curl -s "https://pay.7-eleven.com.ph/transaction/show/$ID" \
 #-b "$COOKIE" \
 #-H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36 Edg/136.0.0.0' \
 #-o "$LOG_FILE" --write-out "%{http_code}")

#curl 'https://pay.7-eleven.com.ph/transaction/index/2717242647' \
 #-H 'Content-Type: application/x-www-form-urlencoded' \
 #-b 'JSESSIONID=m1db2jopgcye16auikn7ji1iu; SERVERID=web-172-0-52' \
 #-H 'Origin: https://pay.7-eleven.com.ph' \
 #-H 'Referer: https://pay.7-eleven.com.ph/transaction/show/2717242647' \
 #-H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36 Edg/136.0.0.0' \
 #--data-raw '_action_sendSaleAdvicePAID=Send+Sale+Advice'
