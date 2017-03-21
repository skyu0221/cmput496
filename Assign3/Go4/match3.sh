#!/bin/bash

set -eu
RESULTDIR="part3test3"
# Modify paths to your programs below as needed
NOGO1="./Go4/Go4.py --sim 50"
NOGO2="./Go4AC.py --sim 50"
TWOGTP=gogui-twogtp 

run() {
echo Match with $NUGAMES games on board size $BOARDSIZE. Storing results in $RESULTDIR

mkdir -p $RESULTDIR
$TWOGTP -black "$NOGO1" -white "$NOGO2" \
-auto -komi 6.5 -size $BOARDSIZE -games $NUGAMES \
-sgffile $RESULTDIR/test3 -threads 8

$TWOGTP -analyze $RESULTDIR/test3.dat -force
}

NUGAMES=100
BOARDSIZE=5
run
