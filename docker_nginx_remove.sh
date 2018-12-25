#!/bin/bash

cd $(dirname $0)
script_dir=$(pwd)
script_name=$(basename $0)

echo ${script_name} started at $(date)
echo working directory is ${script_dir}

docker stop mita_nginx
docker rm mita_nginx

echo ${script_name} finished at $(date)
