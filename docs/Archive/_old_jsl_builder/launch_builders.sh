#!/bin/bash
set -ueo pipefail
IFS=$'\n\t'

echo "Launching JSL builder"
jolie build_jsl.ol ../documentation/jsl $JOLIE_HOME/include/