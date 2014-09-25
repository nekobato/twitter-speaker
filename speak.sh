#!/bin/sh

mpg321 "$1" -q -w - | \
play -q -t wav - tempo -s 1.3
