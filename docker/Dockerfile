FROM centos:8

LABEL maintainer="philipp.salvisberg@trivadis.com"
LABEL description="Tools to generate HTML and PDF using Materials for MkDocs and wkhtmltopdf."
LABEL build.command="docker build . --tag trivadis/mktools:latest"

# install python, not part of centos
# see https://computingforgeeks.com/how-to-install-python-on-3-on-centos/
RUN yum -y update
RUN yum -y groupinstall "Development Tools"
RUN yum -y install openssl-devel bzip2-devel libffi-devel
RUN yum -y install wget
RUN wget https://www.python.org/ftp/python/3.8.3/Python-3.8.3.tgz
RUN tar xvf Python-3.8.3.tgz
RUN /bin/bash -c 'cd Python-3.8*/; ./configure --enable-optimizations; make altinstall'

# install git
RUN yum install -y git

# install python modules (most recent versions)
RUN pip3.8 install --upgrade pip
RUN pip3.8 install mkdocs \
                   mkdocs-material \
                   mkdocs-awesome-pages-plugin \
                   pymdown-extensions \
                   mike 

# install wkhtmltox 0.12.6
RUN yum install -y https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6-1/wkhtmltox-0.12.6-1.centos8.x86_64.rpm

# set environment
ENV LANG=en_US.utf8

# volume for GitHub project's root folder containing docs folder  
RUN mkdir /data
VOLUME ["/data"]

# port for mkdocs serve
EXPOSE 8000
