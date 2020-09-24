FROM centos:8

LABEL maintainer="philipp.salvisberg@trivadis.com"
LABEL description="Tools to generate HTML and PDF using Materials for MkDocs and wkhtmltopdf."
LABEL build.command="docker build . --tag trivadis/mktools:latest"

# install python, not part of centos
# see https://www.osetc.com/en/how-to-install-the-latest-python-3-3-6-x-3-7-x-on-centos-7-or-rhel-7.html
RUN yum install -y https://centos7.iuscommunity.org/ius-release.rpm
RUN yum update -y
RUN yum install -y python36u python36u-libs python36u-devel python36u-pip

# install git and wget
RUN yum install -y git
RUN yum install -y wget

# install wkhtmltox 0.12.4 since 0.12.5 cannot create TOCs, see https://github.com/wkhtmltopdf/wkhtmltopdf/issues/3995
# RUN yum install -y https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.5/wkhtmltox-0.12.5-1.centos7.x86_64.rpm
RUN yum install -y yum install -y wkhtmltopdf
RUN wget -q https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.4/wkhtmltox-0.12.4_linux-generic-amd64.tar.xz -O /tmp/wkhtmltox.tar.xz && \
    tar xvf /tmp/wkhtmltox.tar.xz -C /tmp && \
    cp -rp /tmp/wkhtmltox/* /usr/local && \
    rm -rf /tmp/wkhtmltox*

# install python modules (most recent versions)
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
