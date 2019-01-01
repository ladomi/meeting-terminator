#!/bin/bash

cd $(dirname $0)
script_dir=$(pwd)
script_name=$(basename $0)

echo ${script_name} started at $(date)
echo working directory is ${script_dir}

bash docker_nginx_remove.sh

docker run -itd -p 10080:80 --name mita_nginx nginx

docker exec -it mita_nginx apt-get update
docker exec -it mita_nginx apt-get install unzip

bash docker_nginx_cp.sh

<< comment
docker exec -it mita_nginx /bin/bash
comment

echo ${script_name} finished at $(date)
