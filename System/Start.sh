#!/bin/ash

if [[ ! -z ${MODULE} ]]; then
	composer require ${MODULE} --working-dir=/home/container/Root;
fi;

echo "⟳ Starting PHP-FPM ..."
/usr/sbin/php-fpm8 --fpm-config /home/container/System/Config/PHP-FPM/php-fpm.conf --daemonize

echo "⟳ Starting Nginx ..."
echo "✓ Successfully Started !"
/usr/sbin/nginx -c /home/container/System/Config/Nginx/nginx.conf -p /home/container/
