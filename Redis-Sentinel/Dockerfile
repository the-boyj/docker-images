FROM redis

MAINTAINER Carrey (jaehun.lee@ticketlink.co.kr)

## Copy Redis File
## 복사/추가 하는파일의 Container내 경로는 항상 절대경로로 작성하여야 한다.
#RUN rm -rf /usr/local/bin/sentinel-entrypoint.sh
ADD ./sentinel.conf /data/sentinel.conf
ADD ./sentinel-entrypoint.sh /data/sentinel-entrypoint.sh

## change access authority
#RUN chmod 755 /usr/local/bin/sentinel.conf
#RUN chmod 755 /usr/local/bin/sentinel-entrypoint.sh
#RUN chown redis:redis /usr/local/bin/sentinel.conf
#RUN chown redis:redis /usr/local/bin/sentinel-entrypoint.sh

EXPOSE $CLIENTPORT
ENTRYPOINT ["/data/sentinel-entrypoint.sh"]
CMD [ "redis-server","/data/sentinel.conf", "--sentinel" ]
