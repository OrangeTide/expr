#!/bin/sh
# generated with: jam -a -o build.sh
# then hand-edited.
leg -oexpr.c expr.leg
cc -c -o expr.o -W -Wall -g -O  -I. expr.c
cc  -o expr  expr.o
