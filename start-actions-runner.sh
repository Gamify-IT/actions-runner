#!/usr/bin/env bash

echo url=$url
echo token=$token
echo name=$name

if [ ! -f "configured" ]; then
    ./config.sh --unattended --url $url --token $token --name $name
    touch "configured"
fi

./run.sh
