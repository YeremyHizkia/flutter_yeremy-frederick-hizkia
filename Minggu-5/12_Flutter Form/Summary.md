Nama		: Yeremy Frederick Hizkia Sitorus
Program	    : Flutter - A 
Tugas		: Flutter Form

3 poin yang saya pelajari pada materi ini:
    1. Untuk membuat sebuah form pada flutter sendiri biasanya menggunakan Widget StatefulWidget dan form sendiri disimpan menggunakan GlobalKey<FormState>. Form ini merupakan sebuah isian yang dapat menampung isi lebih dari satu data.

    2.Untuk membuat suatu inputan yang menerima isian data dari pengguna, bisa digunakan textField yang dimana nanti datanya akan diambil menggunakan sebuah controller yang bernama TextEditingController.
    seperti contoh:
    var inputController = TextEditingController();

    kemudian setelah di inisialisasi:
    TextField(
        controller: inputController,
    );

    3.RadioButton walaupun bukan bagian dari widget form bawaan dalam flutter, widget ini dapat di integrasikan ke dalam flutter form untuk membuat form lebih interaktif, untuk pemanggilannya bisa sebagai berikut:
    var radioValue = “”;

    Radio<String>(
    value: ‘Tugas 11’, 
    groupValue: radioValue,
    onChanged: (String? value) {
    setState(() {
        radioValue = value ?? ‘’;
        });
    },
    );

Atau bisa diakses melalui Link Google Docs berikut:
https://docs.google.com/document/d/1eGn5c55cW8v3w-KIC6Q9iWYbwClLB5lB4ongErcxbMI/edit?usp=sharing

