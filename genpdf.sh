#/bin/bash

docker run -v $(pwd):/data --rm -it trivadis/mktools bash -c "cd /data; ./genpdf-in-container.sh"