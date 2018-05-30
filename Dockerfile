FROM nginx:latest

MAINTAINER Dmytro Symonenko
COPY content /nginx/html 
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]