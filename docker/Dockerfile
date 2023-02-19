FROM oraclelinux:8.6
ARG TARGETPLATFORM

LABEL maintainer="philipp.salvisberg@trivadis.com"
LABEL description="Tools to generate HTML and PDF using Materials for MkDocs and wkhtmltopdf."

# To build a mulit-architecture image and push it to the docker registry (load is not supported)
LABEL build.prepare.command="docker buildx create --use --name mktools"
LABEL build.multiarch.command="docker buildx build --platform linux/amd64,linux/arm64 . --tag trivadis/mktools:latest --push"

# To build a single-architecture image and load it into local docker images list (not possible for multi-architecture images)
LABEL build.amd64.command="docker buildx build --platform linux/amd64 . --tag trivadis/mktools:latest --load"
LABEL build.arm64.command="docker buildx build --platform linux/arm64 . --tag trivadis/mktools:latest --load"

# install python
RUN dnf -y update
RUN dnf -y install python39 python39-pip

# install git
RUN dnf -y install git

# install python modules
# using "--root" should suppress "WARNING: Running pip install with root privileges is generally not a good idea." in future releases
RUN python3 -m pip install --upgrade pip --root /
RUN python3 -m pip install --root / \
        'mkdocs==1.3.1' \
        'mkdocs-material==8.3.9' \
        'mkdocs-awesome-pages-plugin==2.8.0' \
        'pymdown-extensions==9.5' \
        'mike==1.1.2' \
        'setuptools==63.4.2'

# install wkhtmltox 0.12.6.1 r2
RUN if [ "$TARGETPLATFORM" == "linux/amd64" ] ; \
    then dnf -y install https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6.1-2/wkhtmltox-0.12.6.1-2.almalinux8.x86_64.rpm ; \
    else dnf -y install https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6.1-2/wkhtmltox-0.12.6.1-2.almalinux8.aarch64.rpm ; \
    fi

# install Node.js, PostCSS Preset Env and csstools-cli (used to simplify CSS so that it is understood by wkhtmltopdf)
RUN dnf -y module install nodejs:16
RUN npm install postcss-preset-env -g
RUN npm install @csstools/csstools-cli -g

# set environment
ENV LANG=en_US.utf8

# volume for GitHub project's root folder containing docs folder  
RUN mkdir /data
VOLUME ["/data"]

# port for mkdocs serve
EXPOSE 8000
