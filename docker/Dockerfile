FROM centos:7.5.1804

LABEL maintainer="philipp.salvisberg@trivadis.com"
LABEL description="Tools to generate website, pdf and ebook using Materials for MkDocs."
LABEL build.command="docker build . --tag trivadis/mktools:latest"

RUN yum install -y https://centos7.iuscommunity.org/ius-release.rpm
RUN yum update -y
RUN yum install -y python36u python36u-libs python36u-devel python36u-pip
RUN yum install -y git
RUN yum install -y https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.5/wkhtmltox-0.12.5-1.centos7.x86_64.rpm
RUN pip3.6 install --upgrade pip
RUN pip3.6 install mkdocs \
                   mkdocs-material \
                   mkdocs-awesome-pages-plugin \
                   pymdown-extensions \
                   mike 

ENV LC_ALL=en_US.utf8
ENV LANG=en_US.utf8

# volume for GitHub project's root folder containing docs folder  
RUN mkdir /data
VOLUME ["/data"]

# port for mkdocs serve
EXPOSE 8000
