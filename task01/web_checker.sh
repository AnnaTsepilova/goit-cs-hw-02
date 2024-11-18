#!/bin/bash

webList=("https://google.com" "https://facebook.com" "https://twitter.com")

logFile="./web_results.txt"
> $logFile

for website in "${webList[@]}"
do
  httpStatus=$(curl -o /dev/null -s -w "%{http_code}" -L "$website")
  
  if [ "$httpStatus" -eq 200 ]; then
    echo "$website is online" >> "$logFile"
  else
    echo "$website is offline" >> "$logFile"
  fi
done

echo "Results in file $logFile"