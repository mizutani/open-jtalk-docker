#!/bin/sh
set -e

set_up () {
  if [ -z "$OPEN_JTALK_DIC_DIR" ]; then
    OPEN_JTALK_DIC_DIR=/data/dictionary
  fi

  if [ -z "$OPEN_JTALK_VOICE" ]; then
    OPEN_JTALK_VOICE=/data/htsvoice/default.htsvoice
  fi

  if [ -z "$OPEN_JTALK_INPUT_DIR" ]; then
    OPEN_JTALK_INPUT_DIR=/data/open_jtalk/input
  fi

  if [ -z "$OPEN_JTALK_OUTPUT_DIR" ]; then
    OPEN_JTALK_OUTPUT_DIR=/data/open_jtalk/output
  fi

  if [ -z "$OPEN_JTALK_OPTIONS" ]; then
    OPEN_JTALK_OPTIONS="-s 48000 -p 240"
  fi

  if [ -z "$OUTPUT" ]; then
    OUTPUT="result.wav"
  fi
}

input () {
  INPUT=$1
}

output () {
  OUTPUT=$1
}

long_option() {
  case "$1" in
    input) input $2 ;;
    output) output $2 ;;
  esac
}

short_option() {
  case "$1" in
    -)
      set -- `echo $2 | tr '=' ' '`
      key=$1
      val=$2
      long_option $key $val
      ;;
    i) input $2 ;;
    o) output $2 ;;
  esac
}

set_up
while getopts ":i:o:-:" OPT; do
  short_option $OPT $OPTARG
done

shift `expr $OPTIND - 1`

tmpfile=`mktemp`

echo "${1}" | /usr/local/bin/open_jtalk \
  -x $OPEN_JTALK_DIC_DIR \
  -m $OPEN_JTALK_VOICE \
  -ow $tmpfile \
  $OPEN_JTALK_OPTIONS \

mv $tmpfile "${OPEN_JTALK_OUTPUT_DIR}/${OUTPUT}"
