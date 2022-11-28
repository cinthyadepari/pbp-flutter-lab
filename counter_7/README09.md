*Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?*

-- Ya, kita bisa melakukan pengambilan data JSON tanpa membuat model terlebih dahulu. Akan tetapi, yang akan terjadi adalah data yang kita dapat bisa saja tidak sesuai dengan apa yang kita harapkan.

*Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.*

 -- FutureBuilder : menampilkan data yang akan diambil dari web service oleh Future. 
 -- column/padding/row: buat fields
 -- drawer: navbar

*Jelaskan mekanisme pengambilan data dari json hingga dapat ditampilkan pada Flutter.*

-- data dari JSON akan di fetch terlebih dahulu dengan menggunakan widget future, kemudian data tersebut akan ditampilkan dengan menggunakan widget FutureBuilder yang mana akan menampilkan widget lainnya.

*Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.*
 -- pertama saya menambahkan model baru yang bernama mywatchlist yang nantinya akan berkaitan dengan file mywatchlist.dart yang berada pada luar folder model(isinya akan bersesuaian dengan format JSON dari tugas 3 saya sebelumnya). Kemudian saya menambahkan file lagi dengan nama mywatchlist_page.dart(berisi detail lah pokoknya) yang menjadi page baru untuk menampilkan title dari semua film yang terdapat pada tugas 3 saya. Menambahkan tombol navigasi pada drawer. sebelumnya juga saya menjalan flutter pub add http agar program dapat berjalan dengan baik.