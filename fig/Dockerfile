## how to run
## docker run -t -p <port> -v /var/run/docker.sock:/docker.sock -v <figapp>:/app larrycai/fig
FROM ubuntu:latest
MAINTAINER Larry Cai "larry.caiyu@gmail.com"

RUN apt-get update && apt-get install -y curl make
RUN curl -L https://get.docker.io/builds/Linux/x86_64/docker-latest -o /usr/local/bin/docker \
    && chmod +x /usr/local/bin/docker
RUN curl -L https://github.com/docker/fig/releases/download/0.5.2/linux -o /usr/local/bin/fig \
    && chmod +x /usr/local/bin/fig 
ENV DOCKER_HOST unix:///docker.sock

WORKDIR /app
CMD fig up