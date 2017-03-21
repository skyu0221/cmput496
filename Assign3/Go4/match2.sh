#!/bin/bash

set -eu
RESULTDIR="part3test2"
# Modify paths to your programs below as needed
NOGO1="./Go3/Go3.py --sim 50"
NOGO2="./Go4.py --sim 50"
TWOGTP=gogui-twogtp 

run() {
echo Match with $NUGAMES games on board size $BOARDSIZE. Storing results in $RESULTDIR

mkdir -p $RESULTDIR
$TWOGTP -black "$NOGO1" -white "$NOGO2" \
-auto -komi 6.5 -size $BOARDSIZE -games $NUGAMES \
-sgffile $RESULTDIR/test2 -threads 8

$TWOGTP -analyze $RESULTDIR/test2.dat -force
}

NUGAMES=100
BOARDSIZE=5
run
