#!/usr/bin/env bash

echo url=$url
echo token=$token
echo name=$name

./config.sh --unattended --url $url --token $token --name $name

cleanup() {
    echo "Removing runner..."
    ./config.sh remove --unattended --token $token
}

trap 'cleanup; exit 130' INT
trap 'cleanup; exit 143' TERM

./run.sh & wait $!
