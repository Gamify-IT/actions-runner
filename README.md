# Github Actions Runner Dockercontainer

This repo contains a Dockerfile and a docker-compose setup for a multithreaded Github Actions Runner.

## Use
Run it directly with
```sh
docker run -d --env "url=${url}" "token=${token2}" "name=${name2}" --volume "/var/run/docker.sock:/var/run/docker.sock" --name github-actions-runner ghcr.io/gamify-it/github-actions-runner
```
Or configure the docker-compose by add as many runners asyou want into the `docker-compose.yaml` and fill in the credentials into the `.env` file. Then you can run it with
```sh
docker-compose up
```

## Build yourself

Build the Docker-Container
```sh
docker build -t github-actions-runner .
```
And run it with
```sh
docker run -d --env "url=${url}" "token=${token2}" "name=${name2}" --volume "/var/run/docker.sock:/var/run/docker.sock" --name github-actions-runner github-actions-runner
```