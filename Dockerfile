FROM fholzer/nginx-brotli:v1.14.0

COPY nginx.tmpl /etc/nginx/nginx.tmpl
