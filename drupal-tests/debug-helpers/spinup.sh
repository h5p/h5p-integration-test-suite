#!/usr/bin/env bash

# Start containers
docker-compose up -d

# Wait for them to be read
sleep 10

# Install site
docker-compose exec php bash -c "/drush/drush site-install standard --db-url='mysql://drupal:drupal@mariadb/drupal' --site-name=IntegrationTest --account-name=admin --account-pass=admin -y \
  && /drush/drush en h5p, h5peditor -y \
  && chmod -R 777 /var/www/html"
