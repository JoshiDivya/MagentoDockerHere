# magento2-docker

Commands to executes

1. Magento files download using Composer

docker-compose run --rm composer composer create-project --repository-url=https://repo.magento.com/ magento/project-enterprise-edition=2.4.3-p1 .

2. Starting PHP, Nginx and MySQL, ElasticSearch containers

docker-compose run --rm -d server

3. Execute Magento Installation

docker-compose exec php 

php -d memory_limit=-1 bin/magento setup:install --base-url=http://localhost:8000/ --db-host=magento_mysql_1 --db-name=homestead --db-user=homestead --db-password=secret --admin-firstname=Magento --admin-lastname=User --admin-email=user@example.com --admin-user=admin --admin-password=admin123 --language=en_US --currency=USD --timezone=America/Chicago --cleanup-database --sales-order-increment-prefix="ORD$" --session-save=db --use-rewrites=1 --search-engine=elasticsearch7 --elasticsearch-host=magento_elasticsearch_1 --elasticsearch-port=9200 --elasticsearch-index-prefix='ee243p1'

4. You can see the magento site on http://localhost:8000/ 

5. To Install Sample data, here is the command:

execute this on src directory:

git clone https://github.com/magento/magento2-sample-data.git sample-data

php -f sample-data/dev/tools/build-sample-data.php -- --ce-source="/var/www/html"
