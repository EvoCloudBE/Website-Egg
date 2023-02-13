#!/bin/ash

if [[ ! -z ${MODULE} ]]; then
	composer require ${MODULE} --working-dir=/home/container/Root;
fi;

if [[ ! -z ${WEBSITE_PATH} ]]; then
	sed -i 's/root \/home\/container\/Root;/root \/home\/container\/Root\/'"${WEBSITE_PATH}"';/' /home/container/System/Config/Nginx/conf.d/default.conf
fi;

if [ "${NAMELESS}" == "true" ] || [ "${NAMELESS}" == "1" ]; then
	sed -i 's/try_files $uri $uri\/ \/index.php?$query_string;/try_files $uri $uri\/ \/index.php?route=$uri&$args;/' /home/container/System/Config/Nginx/conf.d/default.conf
fi

echo "⟳ Starting PHP-FPM ..."
/usr/sbin/php-fpm8 --fpm-config /home/container/System/Config/PHP-FPM/php-fpm.conf --daemonize

echo "⟳ Starting Nginx ..."
echo "✓ Successfully Started !"
/usr/sbin/nginx -c /home/container/System/Config/Nginx/nginx.conf -p /home/container/
