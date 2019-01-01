#!/bin/bash

cd $(dirname $0)
script_dir=$(pwd)
script_name=$(basename $0)

echo ${script_name} started at $(date)
echo working directory is ${script_dir}

docker cp $(pwd)/index.html mita_nginx:/usr/share/nginx/html
docker cp $(pwd)/sound.js mita_nginx:/usr/share/nginx/html
docker cp $(pwd)/init.js mita_nginx:/usr/share/nginx/html
docker cp $(pwd)/se mita_nginx:/usr/share/nginx/html/se

docker cp $(pwd)/bootstrap-4.2.1-dist.zip mita_nginx:/usr/share/nginx/html
docker cp $(pwd)/open-iconic-master.zip mita_nginx:/usr/share/nginx/html

docker exec mita_nginx unzip -o /usr/share/nginx/html/bootstrap-4.2.1-dist.zip -d /usr/share/nginx/html
docker exec mita_nginx unzip -o /usr/share/nginx/html/open-iconic-master.zip -d /usr/share/nginx/html

<< comment
comment

echo ${script_name} finished at $(date)
