#!/bin/bash

cd $(dirname $0)
script_dir=$(pwd)
script_name=$(basename $0)

echo ${script_name} started at $(date)
echo working directory is ${script_dir}

bash docker_nginx_remove.sh

docker run -itd -p 10080:80 --name mita_nginx nginx
# docker run -itd -p 80:80 -v $(pwd)/html:/usr/share/nginx/html --name mita_nginx nginx

bash docker_nginx_cp.sh

<< comment
comment

echo ${script_name} finished at $(date)
