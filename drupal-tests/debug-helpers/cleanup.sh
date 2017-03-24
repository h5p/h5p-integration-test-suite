#!/usr/bin/env bash

docker-compose exec php bash -c "ls \
  && /drush/drush dis h5peditor, h5p -y \
  && /drush/drush pm-uninstall h5peditor -y \
  && /drush/drush pm-uninstall h5p -y \
  && /drush/drush en h5p, h5peditor -y"

docker-compose exec php bash -c "chmod -R 777 /var/www/html"
