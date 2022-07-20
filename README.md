# Github Actions Runner Dockercontainer

This repo contains a Dockerfile and a docker-compose setup for a multithreaded Github Actions Runner.

## Use

sudo systemctl stop docker
sudo dockerd --storage-opt overlay2.size=20G
sudo rm -rf /var/lib/docker
sudo systemctl start docker

Run it directly with
```sh
docker run -d --env "url=${url}" "token=${token}" "name=${name}" --volume "/var/run/docker.sock:/var/run/docker.sock" --name github-actions-runner ghcr.io/gamify-it/github-actions-runner
```
Or configure the docker-compose by add as many runners asyou want into the `docker-compose.yaml` and fill in the credentials into the `.env` file. Then you can run it with
```sh
docker-compose up
```
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

Build the Docker-Container
```sh
docker build -t github-actions-runner .
```
And run it with
```sh
docker run -d --env "url=${url}" "token=${token}" "name=${name}" --volume "/var/run/docker.sock:/var/run/docker.sock" --name github-actions-runner github-actions-runner
```