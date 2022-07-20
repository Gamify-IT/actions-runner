#!/usr/bin/env bash

echo url=$url
echo token=$token
echo name=$name
echo workdir=$workdir

if [ ! -f "configured" ]; then
    ./config.sh --unattended --url $url --token $token --name $name --work $workdir
    touch "configured"
fi

./run.sh
