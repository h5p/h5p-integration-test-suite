# Commands

Connect database:
```bash
docker-compose exec php bash -c "cd /var/www/html && /wpcli/bin/wp core config --dbname=wordpress --dbuser=wordpress --dbpass=wordpress --dbhost=mariadb --allow-root"
```

Install wordpress:
```bash
docker-compose exec php bash -c "cd /var/www/html && /wpcli/bin/wp core install --url=localhost --title=IntegrationTest --admin_user=admin --admin_password=admin --admin_email=integration.test@joubel.com --skip-email --allow-root"
```

Enable h5p:
```bash
docker-compose exec php bash -c "cd /var/www/html && /wpcli/bin/wp plugin activate h5p --allow-root"
```


# Debug commands

Deactivate h5p:
```bash
docker-compose exec php bash -c "cd /var/www/html && /wpcli/bin/wp plugin deactivate h5p --allow-root"
```

Uninstall h5p:
```bash
docker-compose exec php bash -c "cd /var/www/html && /wpcli/bin/wp plugin uninstall h5p --allow-root"
```

Clone h5p back into folder
```bash
git clone https://github.com/h5p/h5p-wordpress-plugin.git h5p && cd h5p && git submodule update --recursive --init && cd ..
```
