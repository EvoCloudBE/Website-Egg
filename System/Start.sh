#!/bin/ash

if [[ ! -z ${MODULE} ]]; then
	composer require ${MODULE} --working-dir=/home/container/Root;
fi;

echo "⟳ Starting PHP-FPM ..."
/usr/sbin/php-fpm8 --fpm-config /home/container/php-fpm/php-fpm.conf --daemonize

echo "⟳ Starting Nginx ..."
echo "✓ Successfully Started !"
/usr/sbin/nginx -c /home/container/nginx/nginx.conf -p /home/container/
