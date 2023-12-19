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
    unzip \
    wget
rm -rf /var/lib/apt/lists/*
echo "Fetching latest glpi :::::"
wget -O /tmp/glpi-10.0.11.tgz https://github.com/glpi-project/glpi/releases/download/10.0.11/glpi-10.0.11.tgz --no-check-certificate
tar -xzvf /tmp/glpi-10.0.11.tgz -C /var/www/html/ 
rm /tmp/glpi-10.0.11.tgz
chmod -R 777 /var/www/html/glpi
service php8.1-fpm start && nginx -g "daemon off;"