cat << EOF
██╗░░██╗██████╗░░█████╗░███████╗████████╗░██████╗██╗██╗░░██╗
██║░██╔╝██╔══██╗██╔══██╗██╔════╝╚══██╔══╝██╔════╝██║╚██╗██╔╝
█████═╝░██████╔╝███████║█████╗░░░░░██║░░░╚█████╗░██║░╚███╔╝░
██╔═██╗░██╔══██╗██╔══██║██╔══╝░░░░░██║░░░░╚═══██╗██║░██╔██╗░
██║░╚██╗██║░░██║██║░░██║██║░░░░░░░░██║░░░██████╔╝██║██╔╝╚██╗
╚═╝░░╚═╝╚═╝░░╚═╝╚═╝░░╚═╝╚═╝░░░░░░░░╚═╝░░░╚═════╝░╚═╝╚═╝░░╚═╝
EOF
apt-get update 
apt-get install -y \
    nginx \
    php-fpm \
    php-apcu \
    php-gd \
    php-imap \
    php-ldap \
    php-curl \
    php-mysql \
    php-xml \
    php-mbstring \
    php-bcmath \
    php-intl \
    php-bz2 php-zip \
    unzip tar\
    wget
rm -rf /var/lib/apt/lists/*
cp /tmp/nginx-glpi.conf /etc/nginx/sites-available/default
echo ":::::::::::::::::::::::::::::::::::::::::::::::::::"
echo ":::::::::::::NGINX CONFIURE COMPLETE::::::::::::::::"
echo ":::::::::::::::::::::::::::::::::::::::::::::::::::"
wget -O /tmp/glpi.tar.gz https://github.com/glpi-project/glpi/releases/download/10.0.11/glpi-10.0.11.tgz --no-check-certificate
tar -xzvf /tmp/glpi.tar.gz -C /var/www/html/ 
rm /tmp/glpi.tar.gz
chmod -R 777 /var/www/html/glpi
echo ":::::::::::::::::::::::::::::::::::::::::::::::::::"
echo ":::::::::::::STARTING GLPI:::::::::::::::::::::::::"
echo ":::::::::::::::::::::::::::::::::::::::::::::::::::"
service php8.1-fpm start && nginx -g "daemon off;"