#!/bin/bash

IMG="THE IMAGE YOU BUILT"

BIN="-v=`pwd`/bin:/app/bin:rw"
DATA="-v=/your/path/to/data:/app/data:rw"

CMD="/app/bin/run_pyjsonetl.sh"

# Alternatively, you can just set the environmental variables set in ./bin/run_pyjsonetl.sh and then call /app/code/pyjson.py directly

sudo docker run -it --rm $BIN $DATA $IMG $CMD
