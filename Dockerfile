FROM debian:buster-slim

ARG buildtime_BYOND_MAJOR=515
ARG buildtime_BYOND_MINOR=1633

ENV BYOND_MAJOR=$buildtime_BYOND_MAJOR \
    BYOND_MINOR=$buildtime_BYOND_MINOR

RUN dpkg --add-architecture i386 \
    && apt-get update \
    && apt-get install -y \
    curl \
    make \
    unzip \
    libstdc++6:i386 \
    libssl1.1:i386 \
    zlib1g:i386 \
    && curl "http://www.byond.com/download/build/${BYOND_MAJOR}/${BYOND_MAJOR}.${BYOND_MINOR}_byond_linux.zip" -o byond.zip \
    && unzip byond.zip \
    && cd byond \
    && sed -i 's|install:|&\n\tmkdir -p $(MAN_DIR)/man6|' Makefile \
    && make install \
    && chmod 644 /usr/local/byond/man/man6/* \
    && apt-get purge -y --auto-remove curl unzip make \
    && cd .. \
    && rm -rf byond byond.zip /var/lib/apt/lists/*
