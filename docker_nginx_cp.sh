#!/bin/bash

cd $(dirname $0)
script_dir=$(pwd)
script_name=$(basename $0)

echo ${script_name} started at $(date)
echo working directory is ${script_dir}

docker cp $(pwd)/index.html mita_nginx:/usr/share/nginx/html/index.html
docker cp $(pwd)/sound.js mita_nginx:/usr/share/nginx/html/sound.js
docker cp $(pwd)/se mita_nginx:/usr/share/nginx/html/se

docker cp $(pwd)/js mita_nginx:/usr/share/nginx/html/js
docker cp $(pwd)/css mita_nginx:/usr/share/nginx/html/css

<< comment
comment

echo ${script_name} finished at $(date)
