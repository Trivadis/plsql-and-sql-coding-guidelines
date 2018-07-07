#/bin/bash

GIT_USERNAME=$1
GIT_EMAIL=$2

cd /data
git config --global user.name "${GIT_USERNAME}"
git config --global user.email "${GIT_EMAIL}"
mike $3 $4 $5 $6
