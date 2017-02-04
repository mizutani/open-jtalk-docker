FROM alpine:3.5

ENV TMPDIR=/tmp \
    HTS_ENGINE_API=hts_engine_API-1.10 \
    HTS_MISC_PATCH=HTS_misc.c.patch \
    OPEN_JTALK=open_jtalk-1.10 \
    DEFAULT_DIC_DIR=open_jtalk_dic_utf_8-1.10

WORKDIR $TMPDIR

COPY $HTS_ENGINE_API.tar.gz \
     $OPEN_JTALK.tar.gz \
     $HTS_MISC_PATCH \
     $DEFAULT_DIC_DIR.tar.gz \
     ./

RUN apk add --update --upgrade --no-cache --virtual=build-dependencies \
    build-base && \
    apk add --update --upgrade --no-cahce --virtual=run-dependencies \
    libgcc libstdc++

RUN mkdir -p /data/open_jtalk

RUN tar xzvf $HTS_ENGINE_API.tar.gz && \
    tar xzvf $OPEN_JTALK.tar.gz && \
    tar xzvf $DEFAULT_DIC_DIR.tar.gz && \
    mv $DEFAULT_DIC_DIR /data/open_jtalk/dic

RUN patch -u $TMPDIR/$HTS_ENGINE_API/lib/HTS_misc.c < $TMPDIR/$HTS_MISC_PATCH

WORKDIR $TMPDIR/$HTS_ENGINE_API

RUN ./configure && make && make install

WORKDIR $TMPDIR/$OPEN_JTALK

RUN ./configure --with-charset=UTF-8 && make && make install

RUN apk del build-dependencies

RUN rm -rf $TMPDIR/*

WORKDIR /root

COPY ./entrypoint.sh /usr/local/bin/entrypoint.sh

RUN chmod a+x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
