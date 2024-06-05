FROM caddy:2-alpine

COPY Caddyfile /etc/caddy/Caddyfile
COPY html /usr/share/caddy/html

EXPOSE 8080
