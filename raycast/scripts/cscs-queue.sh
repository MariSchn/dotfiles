#!/bin/bash

# @raycast.schemaVersion 1
# @raycast.title CSCS Queue
# @raycast.mode fullOutput
# @raycast.icon images/cscs.png

set -euo pipefail

exec /usr/bin/ssh -naxT -o BatchMode=yes -o ConnectTimeout=10 -o ClearAllForwardings=yes \
  clariden-smarian 'SLURM_BITSTR_LEN=10 exec squeue --user="$USER" --format="%12i %16j %2t %.10L %.5D %14r %19S"'
