#!/usr/bin/env bash

 [ -z "$1" ] && exit 1

curl -s \
      -A "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.6 Safari/605.1.15" \
      -H 'accept: application/json, text/plain, */*' \
      -H 'content-type: application/json' \
      -H 'accept-language: en-US,en;q=0.9,de;q=0.8,fr;q=0.7' \
      "$1" | grep -oP '\b(?:href|src|action|name|email|poster|data-src)="\K[^"]*' | jq -R -C -s 'split("\n") | map(select(length > 0))'




