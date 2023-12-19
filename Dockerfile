# Use a base image
FROM ubuntu:22.04
LABEL maintainer="docker@kraft6.com"

#For TZ data blocking the run
ENV TZ=Asia/Kolkata
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
# # Copy NGINX configuration file
# COPY nginx-glpi.conf /etc/nginx/sites-available/default

COPY nginx-glpi.conf /tmp/

COPY entrypoint.sh /tmp/

WORKDIR /tmp/


# Expose ports
EXPOSE 8888

# Start services
ENTRYPOINT /tmp/entrypoint.sh
