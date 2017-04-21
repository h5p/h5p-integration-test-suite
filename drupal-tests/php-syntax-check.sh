#!/usr/bin/env bash

docker-compose --file docker-compose-old-php.yml up -d
docker-compose --file docker-compose-old-php.yml exec oldphp bash -c \
  "cd /var/www/html && find $directory -type f \( -name "*.php" -o \
   -name "*.inc" -o -name "*.install" -o -name "*.module" \) -print0 \
   | xargs -0 -n 1 php -l"
drupalphpcompatibilitytests=$?
docker-compose --file docker-compose-old-php.yml down
