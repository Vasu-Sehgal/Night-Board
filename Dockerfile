FROM nginx:1.27-alpine
COPY index.html dispatch.html supervisor.html /usr/share/nginx/html/
COPY demo/ /usr/share/nginx/html/demo/
