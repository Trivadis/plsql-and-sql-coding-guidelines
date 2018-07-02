#/bin/bash

docker run -v $(pwd):/data -p 8000:8000 --rm -it trivadis/mktools bash -c "cd /data; mkdocs serve -a 0.0.0.0:8000"