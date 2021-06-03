FROM php:7.4.19-alpine3.13

LABEL author="mybsdc <mybsdc@gmail.com>" \
    maintainer="luolongfei <luolongf@gmail.com>"

ENV TZ Asia/Shanghai

WORKDIR /app

COPY . ./

RUN set -eux \
    && apk update \
    && apk add --no-cache tzdata bash

VOLUME ["/conf", "/app/logs"]

ADD docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]

CMD ["crond", "-f"]
