FROM debian:testing

WORKDIR /actions-runner

RUN apt update -y -q
RUN apt install -y -q wget gpg lsb-release

# install packages required by some actions
RUN wget --quiet -O - https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
RUN echo "deb [signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian bullseye stable" \
    > /etc/apt/sources.list.d/docker.list
RUN apt update
RUN apt install -y -q docker-ce golang openjdk-17-jdk maven git git-lfs npm net-tools curl unzip \
    ca-certificates software-properties-common build-essential openssh-client

ARG runnerVersion="2.295.0"

RUN wget --quiet -O actions-runner.tar.gz https://github.com/actions/runner/releases/download/v${runnerVersion}/actions-runner-linux-x64-${runnerVersion}.tar.gz
RUN tar -xzf actions-runner.tar.gz

RUN bin/installdependencies.sh

COPY start-actions-runner.sh ./
RUN chmod +x ./start-actions-runner.sh

ENV RUNNER_ALLOW_RUNASROOT="1"

ENTRYPOINT ["./start-actions-runner.sh"]