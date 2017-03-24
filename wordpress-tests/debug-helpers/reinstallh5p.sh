#!/usr/bin/env bash

# Deactivate h5p
docker-compose exec php bash -c "cd /var/www/html && /wpcli/bin/wp plugin deactivate h5p --allow-root"

# Uninstall h5p
docker-compose exec php bash -c "cd /var/www/html && /wpcli/bin/wp plugin uninstall h5p --allow-root"

# Re-install h5p
git clone https://github.com/h5p/h5p-wordpress-plugin.git h5p
cd h5p
git submodule update --recursive --init
cd ..

# Re-enable h5p
docker-compose exec php bash -c "cd /var/www/html && /wpcli/bin/wp plugin activate h5p --allow-root"
