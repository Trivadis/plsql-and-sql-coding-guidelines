#!/bin/bash

# serves local gh-pages - use to verify deployed sites with version selector before pushing gh-pages branch
DATA_DIR="$(cd "$(dirname "${0}")/.." && pwd)"
## windows hosts require leading // instead of /
case "$OSTYPE" in
  msys*)    DATA_DIR="/${DATA_DIR}" ;;
  cygwin*)  DATA_DIR="/${DATA_DIR}" ;;
esac
docker run -v ${DATA_DIR}:/data -p 8000:8000 --rm -it trivadis/mktools bash -c "cd /data; mike serve -a 0.0.0.0:8000"
