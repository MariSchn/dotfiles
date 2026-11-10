#!/bin/bash

# @raycast.schemaVersion 1
# @raycast.title CSCS KeyGen
# @raycast.mode fullOutput
# @raycast.icon images/cscs.png

set -euo pipefail

"$HOME/.local/bin/cscs-key" sign -f "$HOME/.ssh/cscs-key-smarian"
