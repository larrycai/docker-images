# This Dockerfile is used to build an image containing basic stuff to be used as a Jenkins slave build node.
# it has a base from https://github.com/evarga/docker-images/blob/master/jenkins-slave

FROM ubuntu:latest

MAINTAINER Larry Cai <larry.caiyu@gmail.com>

# Make sure the package repository is up to date.
RUN apt-get update

# Install a basic SSH server
RUN apt-get install -y openssh-server
RUN mkdir -p /var/run/sshd

# Install JDK 7 (latest edition)
RUN apt-get install -y --no-install-recommends openjdk-7-jdk

# Add user jenkins to the image
RUN adduser --quiet jenkins
# Set password for the jenkins user (you may want to alter this).
RUN echo "jenkins:jenkins" | chpasswd

# add docker inside
RUN apt-get install -y curl make
RUN curl https://get.docker.io/builds/Linux/x86_64/docker-latest -o /usr/local/bin/docker
RUN chmod +x /usr/local/bin/docker

# Standard SSH port
EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
