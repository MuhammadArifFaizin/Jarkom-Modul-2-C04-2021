## No 1
# tes internet
# EniesLobby 
echo '
nameserver 192.168.122.1
# nameserver 10.16.2.2
# nameserver 10.16.2.3
' > etc/resolv.conf
ping google.com

# Water7
echo '
nameserver 192.168.122.1
# nameserver 10.16.2.2
# nameserver 10.16.2.3
' > etc/resolv.conf
ping google.com

# Skypie
echo '
nameserver 192.168.122.1
# nameserver 10.16.2.2
# nameserver 10.16.2.3
' > etc/resolv.conf
ping google.com

# Loguetown
echo '
nameserver 192.168.122.1
# nameserver 10.16.2.2
# nameserver 10.16.2.3
' > etc/resolv.conf
ping google.com

# Alabasta
echo '
nameserver 192.168.122.1
# nameserver 10.16.2.2
# nameserver 10.16.2.3
' > etc/resolv.conf
ping google.com

# kembalikan konfigurasi
# EniesLobby 
echo '
nameserver 192.168.122.1
# nameserver 10.16.2.2
# nameserver 10.16.2.3
' > etc/resolv.conf
ping google.com

# Water7
echo '
nameserver 192.168.122.1
# nameserver 10.16.2.2
# nameserver 10.16.2.3
' > etc/resolv.conf
ping google.com

# Skypie
echo '
nameserver 192.168.122.1
# nameserver 10.16.2.2
# nameserver 10.16.2.3
' > etc/resolv.conf
ping google.com

# Loguetown
echo '
# nameserver 192.168.122.1
nameserver 10.16.2.2
# nameserver 10.16.2.3
' > etc/resolv.conf
ping google.com

# Alabasta
echo '
# nameserver 192.168.122.1
nameserver 10.16.2.2
# nameserver 10.16.2.3
' > etc/resolv.conf
ping google.com

## No 2
# tes franky.c04.com
ping franky.c04.com

## No 3
# tes super.franky.c04.com
ping super.franky.c04.com
# IP akan mengarah ke 10.16.2.4

## No 4
# Cek reverse domain
# di client Loguetown atau Alabasta
apt-get update
apt-get install dnsutils -y

host -t PTR 10.16.2.2