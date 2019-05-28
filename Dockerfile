FROM alpine:3.8.4

RUN apk --update add python py-pip zip groff less bash curl git && \
    pip install -U awscli && \
    apk --purge -v del py-pip && \
    rm -rf `find / -regex '.*\.py[co]'`

RUN echo http://dl-cdn.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories && apk add --no-cache mongodb-tools

ADD backup.sh /usr/local/bin/backup

RUN ["chmod", "+x", "/usr/local/bin/backup"]

CMD /usr/local/bin/backup
