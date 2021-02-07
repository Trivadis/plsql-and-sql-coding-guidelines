#!/bin/bash

# serves from temporary site directory - use during development for live preview of changes in docs directory
DATA_DIR="$(cd "$(dirname "${0}")/.." && pwd)"
docker run -v ${DATA_DIR}:/data -p 8000:8000 --rm -it trivadis/mktools bash -c "cd /data; mkdocs serve -a 0.0.0.0:8000"