#/bin/bash

DATA_DIR="$(cd "$(dirname "${0}")/.." && pwd)"
docker run -v ${DATA_DIR}:/data --rm -it trivadis/mktools bash -c "cd /data; ./tools/genpdf-in-container.sh"
