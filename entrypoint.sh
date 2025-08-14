 #!/usr/bin/env bash
echo "Running nginx on port $NGINX_PORT"
sed "s|\${NGINX_PORT}|$NGINX_PORT|" /etc/nginx/nginx.template > /etc/nginx/nginx.conf
nginx -g 'daemon off;'