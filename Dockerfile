# production environment
FROM nginx:stable

RUN apt-get update

RUN apt-get install --no-install-recommends --no-install-suggests -y \
                        libgd-dev \
                        nginx-module-image-filter \
                        libexif-dev

WORKDIR /usr/share/nginx/html
COPY src/ .
# new
COPY nginx/nginx.conf /etc/nginx/conf.d/default.conf
COPY nginx/main_nginx.conf /etc/nginx/nginx.conf

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
