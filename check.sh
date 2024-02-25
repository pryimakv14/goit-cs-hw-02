#!/bin/bash

make_request() {
    url=$1
    curl -s -o /dev/null -w "%{http_code}" "$url"
}

urls=("https://www.google.com" "https://www.facebook.com" "https://twitter.com")
for url in "${urls[@]}"; do
    response_code=$(make_request "$url")
    if [[ $response_code == "200" ]]; then
        status="UP"
    else
        status="DOWN"
    fi
    echo "$url is $status"
    echo "$url is $status" >> website_status.log
done
echo "Check is finished"
