FROM alpine:3.2
MAINTAINER kimico

RUN apk add --update openssh-client && rm -rf /var/cache/apk/*

CMD chmod -R 600 /root/.ssh/* && \
ssh \
-vv \
-o StrictHostKeyChecking=no \
-N $TUNNEL_HOST \
-L $BIND_IP:$LOCAL_PORT:$REMOTE_HOST:$REMOTE_PORT \
&& while true; do sleep 30; done;
