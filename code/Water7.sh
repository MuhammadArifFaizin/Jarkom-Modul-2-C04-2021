apt-get update
apt-get install bind9 -y

echo '
//
// Do any local configuration here
//

// Consider adding the 1918 zones here, if they are not used in your
// organization
//include "/etc/bind/zones.rfc1918";

zone "mecha.franky.c04.com" {
        type master;
        // allow-transfer {10.16.2.2;};
        // masters { 10.16.2.2; };
        // file "/var/lib/bind/franky.c04.com";
        file "/etc/bind/sunnygo/mecha.franky.c04.com";
};
' > /etc/bind/named.conf.local

echo '
options {
        directory "/var/cache/bind";

        // dnssec-validation auto;
        allow-query{any;};

        auth-nxdomain no;    # conform to RFC1035
        listen-on-v6 { any; };
};
' > /etc/bind/named.conf.options

mkdir /etc/bind/sunnygo

echo '
;
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     mecha.franky.c04.com. root.mecha.franky.c04.com. (
                              2         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      mecha.franky.c04.com.
@       IN      A       10.16.2.4
www     IN      CNAME   mecha.franky.c04.com.
general IN      A       10.16.2.4
www.general     IN      CNAME   general
' > /etc/bind/sunnygo/mecha.franky.c04.com

service bind9 restart