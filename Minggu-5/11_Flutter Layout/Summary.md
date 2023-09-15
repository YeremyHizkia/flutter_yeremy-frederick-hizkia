Nama		: Yeremy Frederick Hizkia Sitorus
Program	    : Flutter - A 
Tugas		: Flutter Layout

3 poin yang saya pelajari pada materi ini:
    1. Single Child merupakan sebuah widget yang hanya dapat memiliki satu widget di dalamnya. Tipe widget seperti ini memiliki sebuah properti yang bernama “child” yang digunakan untuk memasukkan widget lain kedalam single child, seperti contoh pada widget Container terdapat child yang dapat menampung widget lainnya seperti text. Widget lainnya seperti Center, Expanded, dan lainnya.

    2. Beda hal nya dengan Multi-child, yang dapat memiliki lebih dari satu widget lain di dalamnya. Untuk menggunakannya biasanya dengan properties bernama “children”. Contoh untuk multi child sendiri seperti: Column, Row, ListView, dan lainnya.
    Untuk contoh codenya bisa dilihat pada berikut:
    Column (
        children: <Widget> [
            Text (‘Ini adalah contoh multi child’),
        ],
        )

    3. Dan sewaktu menggunakan single ataupun multi child, kita hendaknya memperhatikan widget lain apa saja yang dapat digunakan pada suatu widget yang sedang kita gunakan.


Atau bisa diakses melalui Link Google Docs berikut:
https://docs.google.com/document/d/1w7sawhq-qRcNyBZDA85frd-m1pVssTfcYUcdbiA5Mms/edit?usp=sharing