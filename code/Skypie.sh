apt-get update
apt-get install apache2 -y
apt-get install php -y
apt-get install libapache2-mod-php7.0 -y
apt-get install wget -y
apt-get install unzip -y

wget https://github.com/FeinardSlim/Praktikum-Modul-2-Jarkom/archive/refs/heads/main.zip
unzip /root/main.zip
unzip /root/Praktikum-Modul-2-Jarkom-main/franky.zip -d /root/Praktikum-Modul-2-Jarkom-main
unzip /root/Praktikum-Modul-2-Jarkom-main/super.franky.zip -d /root/Praktikum-Modul-2-Jarkom-main
unzip /root/Praktikum-Modul-2-Jarkom-main/general.mecha.franky.zip -d /root/Praktikum-Modul-2-Jarkom-main

cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/franky.c04.com.conf

echo '
<VirtualHost *:80>
        # The ServerName directive sets the request scheme, hostname and port t$
        # the server uses to identify itself. This is used when creating
        # redirection URLs. In the context of virtual hosts, the ServerName
        # specifies what hostname must appear in the requests Host: header to
        # match this virtual host. For the default virtual host (this file) this
        # value is not decisive as it is used as a last resort host regardless.
        # However, you must set it for any further virtual host explicitly.
        #ServerName www.example.com

        ServerAdmin webmaster@localhost
        DocumentRoot /var/www/franky.c04.com
        ServerName franky.c04.com
        ServerAlias www.franky.c04.com

        <Directory /var/www/franky.c04.com>
        Options +FollowSymLinks -Multiviews
        AllowOverride All
        </Directory>

        # Available loglevels: trace8, ..., trace1, debug, info, notice, warn,
        # error, crit, alert, emerg.
        # It is also possible to configure the loglevel for particular
        # modules, e.g.
        #LogLevel info ssl:warn

        ErrorLog ${APACHE_LOG_DIR}/error.log
        CustomLog ${APACHE_LOG_DIR}/access.log combined

        # For most configuration files from conf-available/, which are
 # enabled or disabled at a global level, it is possible to
        # include a line for only one particular virtual host. For example the
        # following line enables the CGI configuration for this host only
        # after it has been globally disabled with a2disconf.
        #Include conf-available/serve-cgi-bin.conf
</VirtualHost>

# vim: syntax=apache ts=4 sw=4 sts=4 sr noet
' > /etc/apache2/sites-available/franky.c04.com.conf

mkdir /var/www/franky.c04.com
cp /root/Praktikum-Modul-2-Jarkom-main/franky/home.html /var/www/franky.c04.com/
cp /root/Praktikum-Modul-2-Jarkom-main/franky/index.php /var/www/franky.c04.com/

a2ensite franky.c04.com
service apache2 restart

a2enmod rewrite
service apache2 restart

touch /var/www/franky.c04.com/.htaccess

echo '
RewriteEngine On
RewriteRule ^home$ index.php/home
' > /var/www/franky.c04.com/.htaccess

cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/super.franky.c04.com.conf

echo '
<VirtualHost *:80>
        # The ServerName directive sets the request scheme, hostname and port t$
        # the server uses to identify itself. This is used when creating
        # redirection URLs. In the context of virtual hosts, the ServerName
        # specifies what hostname must appear in the requests Host: header to
        # match this virtual host. For the default virtual host (this file) this
        # value is not decisive as it is used as a last resort host regardless.
        # However, you must set it for any further virtual host explicitly.
        #ServerName www.example.com

        ServerAdmin webmaster@localhost
        DocumentRoot /var/www/super.franky.c04.com
        ServerName super.franky.c04.com
        ServerAlias www.super.franky.c04.com

        <Directory /var/www/super.franky.c04.com/public>
            Options +Indexes
        </Directory>
        ErrorDocument 404 /error/404.html
        
        Alias "/js" "/var/www/super.franky.c04.com/public/js"
        
        <Directory /var/www/super.franky.c04.com/public/*>
            Options -Indexes
        </Directory>
        
        <Directory /var/www/super.franky.c04.com/public/images>
            Options +Indexes
        </Directory>
        # Available loglevels: trace8, ..., trace1, debug, info, notice, warn,
        # error, crit, alert, emerg.
        # It is also possible to configure the loglevel for particular
        # modules, e.g.
        #LogLevel info ssl:warn
 ErrorLog ${APACHE_LOG_DIR}/error.log
        CustomLog ${APACHE_LOG_DIR}/access.log combined

        # For most configuration files from conf-available/, which are
        # enabled or disabled at a global level, it is possible to
        # include a line for only one particular virtual host. For example the
        # following line enables the CGI configuration for this host only
        # after it has been globally disabled with "a2disconf.
        #Include conf-available/serve-cgi-bin.conf
</VirtualHost>
# vim: syntax=apache ts=4 sw=4 sts=4 sr noet
' > /etc/apache2/sites-available/super.franky.c04.com.conf

mkdir /var/www/super.franky.c04.com

cp -r /root/Praktikum-Modul-2-Jarkom-main/super.franky/error /var/www/super.franky.c04.com
cp -r /root/Praktikum-Modul-2-Jarkom-main/super.franky/public /var/www/super.franky.c04.com

a2ensite super.franky.c04.com
service apache2 restart

touch /var/www/super.franky.c04.com/.htaccess

echo '
RewriteEngine On
RewriteRule ^(.*)franky(.*)\.(jpg|gif|png)$ http://super.franky.c04.com/public/images/franky.png [L,R]
' > /var/www/super.franky.c04.com/.htaccess

cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/general.mecha.franky.c04.com.conf

echo '
<VirtualHost *:15000 *:15500>
        # The ServerName directive sets the request scheme, hostname and port t$
        # the server uses to identify itself. This is used when creating
        # redirection URLs. In the context of virtual hosts, the ServerName
        # specifies what hostname must appear in the requests Host: header to
        # match this virtual host. For the default virtual host (this file) this
        # value is not decisive as it is used as a last resort host regardless.
        # However, you must set it for any further virtual host explicitly.
        #ServerName www.example.com

        ServerAdmin webmaster@localhost
        DocumentRoot /var/www/general.mecha.franky.c04.com
        ServerName general.mecha.franky.c04.com
        ServerAlias www.general.mecha.franky.c04.com

        <Directory /var/www/general.mecha.franky.c04.com>
            Options +FollowSymLinks -Multiviews
            AllowOverride All
        </Directory>

        # Available loglevels: trace8, ..., trace1, debug, info, notice, warn,
        # error, crit, alert, emerg.
        # It is also possible to configure the loglevel for particular
        # modules, e.g.
        #LogLevel info ssl:warn
 ErrorLog ${APACHE_LOG_DIR}/error.log
        CustomLog ${APACHE_LOG_DIR}/access.log combined

        # For most configuration files from conf-available/, which are
        # enabled or disabled at a global level, it is possible to
        # include a line for only one particular virtual host. For example the
        # following line enables the CGI configuration for this host only
        # after it has been globally disabled with "a2disconf.
        #Include conf-available/serve-cgi-bin.conf
</VirtualHost>
# vim: syntax=apache ts=4 sw=4 sts=4 sr noet
' > /etc/apache2/sites-available/general.mecha.franky.c04.com.conf

mkdir /var/www/general.mecha.franky.c04.com

cp -a /root/Praktikum-Modul-2-Jarkom-main/general.mecha.franky/. /var/www/general.mecha.franky.c04.com

a2ensite general.mecha.franky.c04.com
service apache2 restart

htpasswd -c /etc/apache2/.htpasswd luffy

touch /var/www/general.mecha.franky.c04.com/.htaccess

echo '
AuthType Basic
AuthName "Restricted Content"
AuthUserFile /etc/apache2/.htpasswd
Require valid-user
' > /var/www/general.mecha.franky.c04.com/.htaccess

touch /var/www/html/.htaccess
echo '
RewriteEngine On
RewriteBase /
RewriteCond %{HTTP_HOST} ^10\.16\.2\.4$
RewriteRule ^(.*)$ http://www.franky.c04.com [L,R=301]
' > /var/www/html/.htaccess
