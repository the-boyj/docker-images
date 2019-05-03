#!/bin/sh
set -e

## from redis-sentinel-4.0.2
sed -i "s/bind 127.0.0.1/bind $CLIENTHOST/g" /data/sentinel.conf
sed -i "s/port 26379/port $CLIENTPORT/g" /data/sentinel.conf
sed -i "s/sentinel monitor mymaster 127.0.0.1 6379 2/sentinel monitor mymaster $MASTERHOST $MASTERPORT $QUORUM/g" /data/sentinel.conf
sed -i "s/sentinel down-after-milliseconds mymaster 30000/sentinel down-after-milliseconds mymaster $DOWN_AFTER_MILLISEC/g" /data/sentinel.conf
#sed -i "s/sentinel failover-timeout mymaster 180000/sentinel failover-timeout mymaster $FAILOVER_TIMEOUT/g" /usr/local/bin/sentinel.conf
#sed -i "s/# sentinel auth-pass mymaster MySUPER--secret-0123passw0rd/sentinel auth-pass mymaster $REQUIREPASS/g" /data/sentinel.conf

# first arg is `-f` or `--some-option`
# or first arg is `something.conf`
if [ "${1#-}" != "$1" ] || [ "${1%.conf}" != "$1" ]; then
        set -- redis-server "$@"
fi


exec "$@"
