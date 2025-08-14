FROM alpine:latest

# Install Nginx and Brotli dependencies
RUN apk add --no-cache nginx nginx-mod-http-brotli

# Remove apk-tools after installation
RUN apk del apk-tools && rm -rf /var/cache/apk/*

# Copy the Nginx configuration file
COPY nginx.conf /etc/nginx/nginx.template

# Expose port 80
ENV NGINX_PORT 8080
EXPOSE 8080

# Deal with the entry point so that the right config is loaded
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
CMD ["sh", "-c", "/entrypoint.sh"]