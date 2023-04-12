ARG BUILD_FROM
FROM $BUILD_FROM

RUN apk update

RUN apk add --no-cache \
    postgresql15=15.2-r0 \
    postgresql15-client=15.2-r0

# hadolint ignore=DL3059
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

# Build arguments
ARG BUILD_ARCH
ARG BUILD_DATE
ARG BUILD_DESCRIPTION
ARG BUILD_NAME
ARG BUILD_REF
ARG BUILD_REPOSITORY
ARG BUILD_VERSION

# Labels
LABEL \
    io.hass.name="${BUILD_NAME}" \
    io.hass.description="${BUILD_DESCRIPTION}" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version=${BUILD_VERSION} \
    maintainer="Matthew Kosmoski <mkosmo@gmail.com>" \
    org.opencontainers.image.title="${BUILD_NAME}" \
    org.opencontainers.image.description="${BUILD_DESCRIPTION}" \
    org.opencontainers.image.vendor="Matthew Kosmoski" \
    org.opencontainers.image.authors="Matthew Kosmoski <mkosmo@gmail.com>" \
    org.opencontainers.image.licenses="MIT" \
    org.opencontainers.image.url="https://github.com/mkosmo/hassio-addon-postgresql15" \
    org.opencontainers.image.source="https://github.com/${BUILD_REPOSITORY}" \
    org.opencontainers.image.documentation="https://github.com/${BUILD_REPOSITORY}/blob/master/README.md" \
    org.opencontainers.image.created=${BUILD_DATE} \
    org.opencontainers.image.revision=${BUILD_REF} \
    org.opencontainers.image.version=${BUILD_VERSION}
