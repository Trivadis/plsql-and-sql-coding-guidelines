FROM oraclelinux:8

LABEL maintainer="philipp.salvisberg@trivadis.com"
LABEL description="Tools to generate HTML and PDF using Materials for MkDocs and wkhtmltopdf."
LABEL build.command="docker build . --tag trivadis/mktools:latest"

# install python
RUN dnf -y update
RUN dnf -y install python38 python38-pip

# install git
RUN dnf -y install git

# install python modules
# using "--root" should suppress "WARNING: Running pip install with root privileges is generally not a good idea." in future releases
RUN python3 -m pip install --upgrade pip --root /
RUN python3 -m pip install --root / \
        'mkdocs==1.1.2' \
        'mkdocs-material==6.2.8' \
        'mkdocs-awesome-pages-plugin==2.5.0' \
        'pymdown-extensions==8.1.1' \
        'mike==0.5.5' 

# install wkhtmltox 0.12.6
RUN dnf -y install https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6-1/wkhtmltox-0.12.6-1.centos8.x86_64.rpm

# set environment
ENV LANG=en_US.utf8

# volume for GitHub project's root folder containing docs folder  
RUN mkdir /data
VOLUME ["/data"]

# port for mkdocs serve
EXPOSE 8000
