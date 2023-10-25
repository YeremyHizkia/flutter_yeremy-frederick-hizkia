Nama		: Yeremy Frederick Hizkia Sitorus
Program	    : Flutter - A 
Tugas		: Resume UI Testing


3 poin yang saya pelajari pada materi ini:
    1. UI Testing merupakan pengujian yang dilakukan pada tampilan suatu aplikasi untuk memastikan aplikasi dapat menerima interaksi dan memberi respon kepada user atau pengguna. UI testing pada flutter disebut juga widget testing sehingga pengujian dilakukan pada widgets dengan menuliskan script (code) yang dapat dijalankan secara otomatis. Keuntungan UI testing yaitu untuk memastikan seluruh widget memberi tampilan yang sesuai, memastikan seluruh interaksi dapat diteima dengan baik, juga menjadi ketentuan yang harus diikuti saat diperlukan perubahan pada widget.

    2. Untuk melakukan sebuah pengujian kita tidak perlu lagi menginstal sebuah package khusus untuk Testing, dikarenakan package testing sudah ter-install sejak proyek pertama kali di build (dibuat). Dan hal itu terdapat pada folder bernama test. Untuk menambahkan sebuah testing baru, hendaknya disertai _test.dart pada penamaan filenya. Contoh: profile_test.dart.

    3. Pada setiap file yang telah dibuat tentunya terdapat fungsi main() didalamnya dapat dituliskan sebuah script testing yang hendak dilakukan. Contohnya:
        void main () {
            testWidgets(‘Test itu harus …’ (WidgetTester tester) async {});
        }


Atau bisa diakses melalui Link Google Docs berikut:
https://docs.google.com/document/d/1k-0C8l_TqLgDpmy258ELhB0VbUjTWwmyfND3aCY8AwA/edit?usp=sharing
