FROM nginx:latest
COPY ./dist /usr/share/nginx/html
COPY ./cicd/nginx.conf /etc/nginx/conf.d/fy-three.conf
EXPOSE 80