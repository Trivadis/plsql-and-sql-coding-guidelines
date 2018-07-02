#/bin/bash

docker run -v $(pwd):/data -p 8000:8000 --rm -it trivadis/mktools bash -c "cd /data; mkdocs gh-deploy"