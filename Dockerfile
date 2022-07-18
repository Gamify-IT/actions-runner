FROM ubuntu:latest



WORKDIR /actions-runner

RUN apt update -y -q
RUN apt install -y -q wget 

# install packages required by some actions
RUN apt install -y -q docker golang maven git git-lfs npm net-tools

ARG RUNNER_VERSION="2.294.0"

RUN wget --quiet -O actions-runner.tar.gz https://github.com/actions/runner/releases/download/v${RUNNER_VERSION}/actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz
RUN tar -xzf actions-runner.tar.gz

RUN bin/installdependencies.sh

COPY start-actions-runner.sh ./
RUN chmod +x ./start-actions-runner.sh

ENV RUNNER_ALLOW_RUNASROOT="1"

ENTRYPOINT ["./start-actions-runner.sh"]