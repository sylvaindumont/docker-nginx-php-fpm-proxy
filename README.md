Proxy a php-fpm container (as drupal:fpm or piwik:fpm)

### How to use
```
services:
  drupal:
    restart: always
    image: drupal:7.54-fpm-alpine
    volumes:
      - drupal:/var/www/html/
    depends_on:
      - mariadb

  drupal-proxy:
    restart: always
    image: weboaks/docker-nginx-php-fpm-proxy
    volumes:
      - drupal:/var/www/html/
    depends_on:
      - drupal
    environment:
      - BACKEND=drupal
    command: /bin/bash -c "envsubst '$$BACKEND' < /etc/nginx/nginx.conf > /etc/nginx/nginx.conf && nginx -g 'daemon off;'"
```
