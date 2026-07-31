FROM nginx:alpine

# Railway (and most PaaS) inject a dynamic $PORT. nginx:alpine runs envsubst on
# any *.template files in /etc/nginx/templates at startup, so we template the port.
ENV PORT=80

COPY default.conf.template /etc/nginx/templates/default.conf.template
COPY index.html styles.css script.js logo.png /usr/share/nginx/html/

EXPOSE 80

HEALTHCHECK --interval=30s --timeout=3s \
  CMD wget -qO- "http://localhost:${PORT:-80}/" >/dev/null 2>&1 || exit 1
