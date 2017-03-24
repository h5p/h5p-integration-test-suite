# Commands

Now enable the h5p plugin:
```bash
drush en h5p, h5peditor
```

Install site
```bash
docker-compose exec php bash -c "/drush/drush site-install standard --db-url='mysql://drupal:drupal@mariadb/drupal' --site-name=IntegrationTest --account-name=admin --account-pass=admin -y \
  && /drush/drush en h5p, h5peditor -y \
  && chmod -R 777 /var/www/html \
  && ls -ld /var/www/html"
  ```
