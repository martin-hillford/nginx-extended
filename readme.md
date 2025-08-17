# NGINX extended
An NGINX image based on nginx:alpine with two additions:

- **Brotli compression enabled**
  Supports both dynamic compression and serving pre-compressed files when a matching .br file is present.
- **Configurable listen port**
  Set the NGINX_PORT environment variable to change the port NGINX listens on—handy when running inside a Podman pod.
  The document root of NGINX is set to `/usr/share/nginx/html` so either use a volume or directory as bind to
  determine the files being served.

**Document root:** /usr/share/nginx/html  
Mount a volume or bind-mount a directory there to serve your files.

## Usage

With the default port (8080)

```bash
docker run \
  -v ./www:/usr/share/nginx/html \
  -p 8080:8080 \
  martinhillford/nginx-extended:latest
```    

Custom port

```bash
docker run \
  -v ./www:/usr/share/nginx/html \
  -e NGINX_PORT=300 \
  -p 3000:3000 \
  martinhillford/nginx-extended:latest
```   

? 

> **Note:** Only the `GET` method is enabled. This container is intended for serving static files.



## Remarks

1) Since `sendfile on;` can cause issue in combination with brotli, it is disabled as it is not needed anyway.