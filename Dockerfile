FROM i386/ubuntu:latest

ARG buildtime_BYOND_MAJOR=513
ARG buildtime_BYOND_MINOR=1530

ENV BYOND_MAJOR=$buildtime_BYOND_MAJOR \
    BYOND_MINOR=$buildtime_BYOND_MINOR

RUN apt-get update \
    && apt-get install -y \
    curl \
    unzip \
    make \
    libstdc++6 \
    && curl "http://www.byond.com/download/build/${BYOND_MAJOR}/${BYOND_MAJOR}.${BYOND_MINOR}_byond_linux.zip" -o byond.zip \
    && unzip byond.zip \
    && cd byond \
    && sed -i 's|install:|&\n\tmkdir -p $(MAN_DIR)/man6|' Makefile \
    && make install \
    && chmod 644 /usr/local/byond/man/man6/* \
    && apt-get purge -y --auto-remove curl unzip make \
    && cd .. \
    && rm -rf byond byond.zip /var/lib/apt/lists/*
