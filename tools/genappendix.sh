#!/bin/bash

DATA_DIR="$(cd "$(dirname "${0}")/.." && pwd)"
## windows hosts require leading // instead of /
case "$OSTYPE" in
  msys*)    DATA_DIR="/${DATA_DIR}" ;;
  cygwin*)  DATA_DIR="/${DATA_DIR}" ;;
esac
docker run -v ${DATA_DIR}:/data --rm -it trivadis/mktools bash -c "cd /data; ./tools/run-in-container/genappendix.sh docs/9-appendix/appendix.md"
