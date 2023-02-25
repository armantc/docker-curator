#this is docker file for creating a image for elastic curator
#for build docker image  run 'docker build --compress -t nkabir1986/personal:1.1-docker-curator .' in console
#for push 'docker image push nkabir1986/personal:1.1-docker-curator' in console and must enable shecan for example : docker push nkabir1986/personal:1.1-shared-subscriptions

FROM python:alpine3.17

ARG CURATOR_VERSION

RUN pip install  elasticsearch-curator==8.0.3 &&\
    rm -rf /var/cache/apk/*

COPY ./config/ /config

RUN /usr/bin/crontab /config/crontab.txt

CMD ["/usr/sbin/crond","-f"]
