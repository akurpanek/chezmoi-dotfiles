#!/bin/sh

SCRIPT_DIR="$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd)"

"$SCRIPT_DIR/.install-bw.sh"
"$SCRIPT_DIR/.install-op.sh"
