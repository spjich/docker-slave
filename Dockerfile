FROM jenkinsci/slave:latest

USER root

RUN usermod -G users -a jenkins && \
    wget -q https://get.docker.com/builds/Linux/x86_64/docker-latest.tgz -O /tmp/docker.tgz && \
    tar xfvz /tmp/docker.tgz -C /tmp/ && \
    cp /tmp/docker/docker /usr/local/bin && \
    curl -L https://github.com/docker/compose/releases/download/1.19.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose && \
    apt-get update && \
    apt-get install make

ENV JAVA_OPTS=-Xmx200m

USER jenkins

WORKDIR /home/${user}
