#!/usr/bin/env bash

# Build containers
docker-compose build

# Spin up containers
docker-compose up -d

# Wait for servers to initialize
echo "Waiting for servers to initialize"
sleep 15

# Install Moodle
docker-compose exec php bash -c "cd /var/www/html/admin/cli && php install.php --wwwroot=http://localhost --dataroot=/var/www/moodledata --dbtype=pgsql --dbhost=postgres --dbname=moodle --dbuser=moodle --dbpass=moodle --fullname=IntegrationTest --shortname=IntegrationTest --adminuser=admin --adminpass=Admin --adminemail=integrationtest@joubel.com --agree-license --allow-unstable --non-interactive"

# Restore permissions
docker-compose exec php bash -c "cd /var/www && chmod -R 777 html"

# Create course
docker-compose exec php bash -c "cd /var/www/html && php admin/tool/uploadcourse/cli/uploadcourse.php --mode=createnew --file=/moodleupload/newcourse.csv"

# Run the tests
cd test || exit
npm install
npm test
success=$?
cd .. || exit

# Clean up all containers
docker-compose down -v

exit "$success"
