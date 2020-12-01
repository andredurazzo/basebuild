FROM maven:3.6.3-amazoncorretto-11
RUN yum install -y python3 python3-pip git

RUN python3 -m pip install \
        awsebcli \
        awscli

RUN curl -L https://github.com/barnybug/cli53/releases/download/0.8.12/cli53-linux-386 > /usr/bin/cli53 && \
    chmod +x /usr/bin/cli53

ENV PAGER="less"

# Expose credentials volume
RUN mkdir ~/.aws
RUN touch ~/.aws/config
RUN touch ~/.aws/credentials
USER root
RUN chmod -R 777 ~/.aws
