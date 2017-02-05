FROM busybox

ENV DATA_DIR=/data/dictionary \
    WORK_DIC_DIR=open_jtalk_dic_utf_8-1.10

COPY $WORK_DIC_DIR.tar.gz .

RUN mkdir -p $DATA_DIR && \
    tar xzvf $WORK_DIC_DIR.tar.gz -C $DATA_DIR --strip-components 1 && \
    rm $WORK_DIC_DIR.tar.gz

WORKDIR $DATA_DIR

VOLUME $DATA_DIR
