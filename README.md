# Praktikum Modul 2 Jaringan Komputer

Kelompok : C4

Anggota Kelompok :

- Muhammad Arif Faizin (05111940000060)
- Aufi Fillah (05111940000148)
- Abiya Sabitta Ragadani (05111940000166)

## Soal
Luffy adalah seorang yang akan jadi Raja Bajak Laut. Demi membuat Luffy menjadi Raja Bajak Laut, Nami ingin membuat sebuah peta, bantu Nami untuk membuat peta berikut:
![Soal](img/Soal.png)
EniesLobby akan dijadikan sebagai DNS Master, Water7 akan dijadikan DNS Slave, dan Skypie akan digunakan sebagai Web Server. Terdapat 2 Client yaitu Loguetown, dan Alabasta. Semua node terhubung pada router Foosha, sehingga dapat mengakses internet (1). 

Luffy ingin menghubungi Franky yang berada di EniesLobby dengan denden mushi. Kalian diminta Luffy untuk membuat website utama dengan mengakses franky.yyy.com dengan alias www.franky.yyy.com pada folder kaizoku (2). Setelah itu buat subdomain super.franky.yyy.com dengan alias www.super.franky.yyy.com yang diatur DNS nya di EniesLobby dan mengarah ke Skypie(3). Buat juga reverse domain untuk domain utama (4). Supaya tetap bisa menghubungi Franky jika server EniesLobby rusak, maka buat Water7 sebagai DNS Slave untuk domain utama (5). Setelah itu terdapat subdomain mecha.franky.yyy.com dengan alias www.mecha.franky.yyy.com yang didelegasikan dari EniesLobby ke Water7 dengan IP menuju ke Skypie dalam folder sunnygo(6). Untuk memperlancar komunikasi Luffy dan rekannya, dibuatkan subdomain melalui Water7 dengan nama general.mecha.franky.yyy.com dengan alias www.general.mecha.franky.yyy.com yang mengarah ke Skypie(7). 

(8) Setelah melakukan konfigurasi server, maka dilakukan konfigurasi Webserver. Pertama dengan webserver www.franky.yyy.com. Pertama, luffy membutuhkan webserver dengan DocumentRoot pada /var/www/franky.yyy.com. (9) Setelah itu, Luffy juga membutuhkan agar url www.franky.yyy.com/index.php/home dapat menjadi menjadi www.franky.yyy.com/home. 

(10) Setelah itu, pada subdomain www.super.franky.yyy.com, Luffy membutuhkan penyimpanan aset yang memiliki DocumentRoot pada /var/www/super.franky.yyy.com .(11) Akan tetapi, pada folder /public, Luffy ingin hanya dapat melakukan directory listing saja.(12) Tidak hanya itu, Luffy juga menyiapkan error file 404.html pada folder /error untuk mengganti error kode pada apache . (13) Luffy juga meminta Nami untuk dibuatkan konfigurasi virtual host. Virtual host ini bertujuan untuk dapat mengakses file asset www.super.franky.yyy.com/public/js menjadi www.super.franky.yyy.com/js. 

(14) Dan Luffy meminta untuk web www.general.mecha.franky.yyy.com hanya bisa diakses dengan port 15000 dan port 15500 (15) dengan authentikasi username luffy dan password onepiece dan file di /var/www/general.mecha.franky.yyy (16)  Dan setiap kali mengakses IP Skypie akan diahlikan secara otomatis ke www.franky.yyy.com (17). Dikarenakan Franky juga ingin mengajak temannya untuk dapat menghubunginya melalui website www.super.franky.yyy.com, dan dikarenakan pengunjung web server pasti akan bingung dengan randomnya images yang ada, maka Franky juga meminta untuk mengganti request gambar yang memiliki substring “franky” akan diarahkan menuju franky.png. Maka bantulah Luffy untuk membuat konfigurasi dns dan web server ini!

PS : 
yyy pada url adalah kode kelompok anda
File Requirement Github

## Jawab

## Persiapan
Diminta untuk membuat topology tersebut, beserta konfigurasinya sesuai dengan role masing-masing. Diminta untuk mengubah EniesLobby menjadi DNS Master, Water7 menjadi DNS Slave, dan Skypie menjadi Web Server. Terdapat 2 Client yaitu Loguetown, dan Alabasta.
![Persiapan 1](img/Persiapan-1.png)

Oleh karena itu, masing-masing network configuration dari setiap node adalah sebagai berikut

### Foosha
![Persiapan Foosha](img/Persiapan-Foosha.png)
### Loguetown
![Persiapan Loguetown](img/Persiapan-Loguetown.png)
### Alabasta
![Persiapan Alabasta](img/Persiapan-Alabasta.png)
### EniesLobby
![Persiapan EniesLobby](img/Persiapan-EniesLobby.png)
### Water7
![Persiapan Water7](img/Persiapan-Water7.png)
### Skypie
![Persiapan Skypie](img/Persiapan-Skypie.png)

## No 1
Karena semua node terhubung pada router Foosha, diminta agar seluruh node dapat mengakses internet.
1. Lakukan `iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE -s 10.16.0.0/16` untuk penyambungan ke internet
2. Untuk pengecekan, lakukan `ping google.com` pada router foosha
![image](https://user-images.githubusercontent.com/63279983/139287232-0ac972b2-171a-44e3-8d56-18b00f8cf0e4.png)

3. Untuk pengeccekan apakah klien node dapat tersambung internet maka dilakukan pengeditan pada file `/etc/resolv.conf` pada node dan setting :
![image](https://user-images.githubusercontent.com/63279983/139288629-5b53156a-0a81-448f-b111-f9dd16ce0dd5.png)

4. Lalu, lakukan `ping google.com` pada Loguetown :
![image](https://user-images.githubusercontent.com/63279983/139288569-06c0fa53-797d-42b2-aa8f-29bfe07ff867.png)

## No 2
