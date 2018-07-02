FROM ubuntu:18.04

LABEL maintainer="philipp.salvisberg@trivadis.com"
LABEL description="Tools to generate website, pdf and ebook using Materials for MkDocs."
LABEL build.command="docker build . --tag trivadis/mktools:latest"

RUN apt-get update 
RUN apt-get upgrade -y
RUN apt-get install -y build-essential \
                       python3-dev \
                       python3-pip \
                       python3-setuptools \
                       python3-wheel \
                       python3-cffi \
                       libcairo2 \
                       libpango-1.0-0 \
                       libpangocairo-1.0-0 \
                       libgdk-pixbuf2.0-0 \
                       libffi-dev \
                       shared-mime-info
RUN apt-get install -y git
RUN pip3 install --upgrade pip
RUN pip3 install mkdocs \
                 mkdocs-material \
                 mkdocs-awesome-pages-plugin \
                 pymdown-extensions \
                 mike \
                 weasyprint 

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

# volume for GitHub project's root folder containing docs folder  
RUN mkdir /data
VOLUME ["/data"]

# port for mkdocs serve
EXPOSE 8000
