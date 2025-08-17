#!/bin/sh
set -eu
echo "Running nginx on port ${NGINX_PORT}"
sed "s|\${NGINX_PORT}|${NGINX_PORT}|" /etc/nginx/nginx.template > /etc/nginx/nginx.conf
exec nginx -g 'daemon off;'