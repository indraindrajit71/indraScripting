FROM atulabhi/kops:v8

MAINTAINER Atul Abhishek <atul.abhishek@mayadata.io>


RUN apt-get update && apt-get install -y software-properties-common

RUN apt-get install cron

ARG SERVICE_ACCOUNT_KEY ""
ENV SERVICE_ACCOUNT_KEY ${SERVICE_ACCOUNT_KEY}
#ENV SERVICE_ACCOUNT_KEY ""

ENV PROJECT_NAME ""


ADD docker-entrypoint.sh /

COPY watch.sh /

RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT /docker-entrypoint.sh


