ARG BUILD_FROM
FROM $BUILD_FROM

RUN apk update

ENV POSTGRES_VERSION 15.2-r0
RUN apk add --no-cache \
    postgresql15=${POSTGRES_VERSION} \
    postgresql15-client=${POSTGRES_VERSION}

RUN mkdir -p /run/postgresql \
    && mkdir -p /run/postgresql/extensions \
	&& chown -R postgres:postgres /run/postgresql \
	&& chown -R postgres:postgres /run/postgresql/extensions

ENV \
    S6_SERVICES_GRACETIME=50000 \
    S6_CMD_WAIT_FOR_SERVICES_MAXTIME=0

COPY rootfs /
RUN chmod +x /etc/cont-init.d/* \
    && chmod +x /etc/services.d/postgres/*

WORKDIR /
