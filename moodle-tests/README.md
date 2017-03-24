# Commands

Install:
```bash
docker-compose exec php bash -c "cd /var/www/html/admin/cli && php install.php --wwwroot=http://localhost --dataroot=/moodledata --dbtype=mariadb --dbhost=mariadb --dbname=moodle --dbuser=moodle --dbpass=moodle --fullname=IntegrationTest --shortname=IntegrationTest --adminuser=admin --adminpass=Admin --adminemail=integrationtest@joubel.com --agree-license --allow-unstable --non-interactive"
```

Restore permissions
```bash
docker-compose exec php bash -c "cd /var/www && chmod -R 777 html"
```

Create course
```bash
docker-compose exec php bash -c "cd /var/www/html && php admin/tool/uploadcourse/cli/uploadcourse.php --mode=createnew --file=/moodleupload/newcourse.csv"
```

