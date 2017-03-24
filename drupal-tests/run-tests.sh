#!/usr/bin/env bash

# Build containers
docker-compose build

# Spin up containers
docker-compose up -d

# Wait for servers to initialize
echo "Waiting for servers to initialize"
sleep 15

# Install drupal
# Enable H5P
# Make sure directory is writable before running integration test
docker-compose exec php bash -c "/drush/drush site-install standard --db-url='mysql://drupal:drupal@mariadb/drupal' --site-name=IntegrationTest --account-name=admin --account-pass=admin -y \
  && /drush/drush en h5p, h5peditor -y \
  && chmod -R 777 /var/www/html"

# Run integration test
cd test
npm install
npm run test
drupaltests=$?
cd ..

# Clean up all containers
docker-compose down -v
