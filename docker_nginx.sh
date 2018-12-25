#!/bin/bash

cd $(dirname $0)
script_dir=$(pwd)
script_name=$(basename $0)

echo ${script_name} started at $(date)
echo working directory is ${script_dir}

docker stop mita_nginx
docker rm mita_nginx

docker run -itd -p 80:80 --name mita_nginx nginx
# docker run -itd -p 80:80 -v $(pwd)/html:/usr/share/nginx/html --name mita_nginx nginx

docker cp $(pwd)/index.html mita_nginx:/usr/share/nginx/html/index.html
docker cp $(pwd)/sound.js mita_nginx:/usr/share/nginx/html/sound.js
docker cp $(pwd)/se/bomb1.mp3 mita_nginx:/usr/share/nginx/html/bomb1.mp3

# docker start mita_nginx
# docker exec -it mita_nginx /bin/bash

<< comment
docker stop test_nginx
docker rm test_nginx
docker rmi nginx:centos
comment

echo ${script_name} finished at $(date)
