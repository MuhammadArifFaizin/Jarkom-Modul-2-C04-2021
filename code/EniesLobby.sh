apt-get update
apt-get install bind9 -y

# Setting Nameserver ke EniesLobby
echo '
# nameserver 192.168.122.1
nameserver 10.16.2.2
# nameserver 10.16.2.3
' > etc/resolv.conf

# Setting Domain ke franky.c04.com
# Setting Reverse DNS untuk franky.c04.com
echo '
zone "franky.c04.com" {
        type master;
        notify yes;
        also-notify { 10.16.2.3; };
        allow-transfer { 10.16.2.3; };
        file "/etc/bind/kaizoku/franky.c04.com";
};

zone "2.16.10.in-addr.arpa" {
    type master;
    file "/etc/bind/kaizoku/2.16.10.in-addr.arpa";
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

mkdir /etc/bind/kaizoku

# Pembuatan Domain ke franky.c04.com
# diarahkan juga ke IP Skypie dan Water7
echo '
;
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     franky.c04.com. root.franky.c04.com. (
                              2         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      franky.c04.com.
@       IN      A       10.16.2.4
www     IN      CNAME   franky.c04.com.
super   IN      A       10.16.2.4       ; IP Skypie
www.super       IN      CNAME   super
ns1     IN      A       10.16.2.3       ; IP Water7
mecha   IN      NS      ns1
' > /etc/bind/kaizoku/franky.c04.com

# pembuatan domain untuk Reverse DNS
echo '
;
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     2.16.10.in-addr.arpa. root.2.16.10.in-addr.arpa. (
                              2         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
2.16.10.in-addr.arpa.   IN      NS      franky.c04.com.
2       IN      PTR     franky.c04.com.
' > /etc/bind/kaizoku/2.16.10.in-addr.arpa

service bind9 restart
