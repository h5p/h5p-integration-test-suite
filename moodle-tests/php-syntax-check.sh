#!/usr/bin/env bash

docker-compose --file docker-compose-old-php.yml up -d
docker-compose --file docker-compose-old-php.yml exec oldphp bash -c \
  "cd /var/www/html && find -type f -name "*.php" -print0 | xargs -0 -n 1 php -l"
success=$?
docker-compose --file docker-compose-old-php.yml down

exit "$success"
