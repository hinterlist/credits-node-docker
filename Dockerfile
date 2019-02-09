FROM ubuntu:18.04

# Update packages
RUN apt-get update && \
    apt-get upgrade -y

# Install Java
RUN apt-get install -y --fix-missing software-properties-common && \
    add-apt-repository ppa:webupd8team/java -y && \
    apt-get update && \
    echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections && \
    apt-get install -y oracle-java8-installer && \
    apt-get clean

# Install supervisor
RUN apt-get -y install supervisor && \
    mkdir -p /var/log/supervisor && \
    mkdir -p /etc/supervisor/conf.d

# Install curl
RUN apt-get -y install curl

# Copy supervisor config
ADD supervisor.conf /etc/supervisor.conf

# Fetch credits node
ADD ./fetch-node.sh /tmp
RUN /tmp/fetch-node.sh

# Setup working dir
WORKDIR /opt/node

# Node network
EXPOSE 6000
# API
EXPOSE 9090
#Contract Executor
EXPOSE 9080

# Run supervisor
CMD ["supervisord", "-c", "/etc/supervisor.conf"]