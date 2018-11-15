# Nginx  + page speed

`docker pull hdigiorgi/nginx_page_speed`

* Nginx: 1.15.6
* Page Speed: 1.13.35.2-stable
* `nginx.conf` is located at `/usr/local/nginx/conf/nginx.conf`

Docker compose example:

```
version: '3.7'
services:
  nginx:
    container_name: nginx
    image: hdigiorgi/nginx_page_speed:latest
    depends_on:
      - app
    ports:
      - "80:80"
      - "443:443"
    volumes:
      - "../nginx.conf:/usr/local/nginx/conf/nginx.conf:ro"
      - type: tmpfs
        target: /dev/nginx_tmpfs
        tmpfs:
          size: 128000000 #128m
```