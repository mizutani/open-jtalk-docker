FROM busybox

ENV DATA_DIR=/data/htsvoice \
    DATA_FILE=default.htsvoice \
    WORK_VOICE_DIR=hts_voice_nitech_jp_atr503_m001-1.05 \
    WORK_VOICE_FILE=nitech_jp_atr503_m001.htsvoice

RUN mkdir -p $DATA_DIR

WORKDIR $DATA_DIR

COPY $WORK_VOICE_DIR.tar.gz .

RUN tar xzvf $WORK_VOICE_DIR.tar.gz

RUN mv $WORK_VOICE_DIR/$WORK_VOICE_FILE ./$DATA_FILE

RUN rm $WORK_VOICE_DIR.tar.gz

RUN rm -rf $WORK_VOICE_DIR

VOLUME $DATA_DIR
