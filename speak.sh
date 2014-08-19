#!/bin/sh

TEXT=$1

echo $1 | \
open_jtalk \
  -x /var/lib/mecab/dic/open-jtalk/naist-jdic \
  -m /usr/share/hts-voice/mei_normal.htsvoice \
  -ow /dev/stdout | \
aplay -i
