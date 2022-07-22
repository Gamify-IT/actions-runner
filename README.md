# Github Actions Runner Dockercontainer

This repo contains a Dockerfile and a docker-compose setup for a multithreaded Github Actions Runner.

## Use

To run one or more runner with docker compose add as many runners as you want into the `docker-compose.yaml` and fill in the credentials into the `.env` file. Then you can run it with
```sh
docker-compose up
```

An example `docker-compose.yaml` entry has the following content:
```sh
runner:
    container_name: ${name}
    image: ghcr.io/gamify-it/actions-runner:latest
    restart: always
    environment:
      - url=${url}
      - token=${token}
      - name=${name}
      - workdir=/actionsRunnerWorkdir/${name}
    extra_hosts:
      - "host.docker.internal:host-gateway"
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
      - /actionsRunnerWorkdir/${name}:/actionsRunnerWorkdir/${name}
```
To work properly the runner needs a volume which has the same path on the host and the container. \
The host entry sets a possiblility to reach the host with the url `host.docker.internal` to for example access a startet docker container.

An example `.env` file has the following content:
```sh
url=https://github.com/Gamify-IT
token=XXXXXXXXXXXXXXXXXXXXXXXXXXXXX
name1=runner-1
name2=runner-2
name3=runner-3
name4=runner-4
```

## Build yourself

Exchange `image: ghcr.io/gamify-it/actions-runner:latest` in the `docker-compose.yaml` with `build .` or use the `docker-compose-dev.yaml`.