Nama		: Yeremy Frederick Hizkia Sitorus
Program	    : Flutter - A 
Tugas		: Form Picker

3 poin yang saya pelajari pada materi ini:
    1. Form Picker merupakan istilah yang mengacu pada komponen UI yang digunakan dalam form pada flutter untuk membantu user memilih atau memberikan inputan data tertentu. Form picker sendiri digunakan dalam berbagai keadaan, seperti saat memilih tanggal hingga memilih sebuah daftar opsi, dan sebagainya.

    2. Salah satu contoh Form picker yang ada seperti Date Picker. Date picker sendiri digunakan secara khusus untuk memilih tanggal. Date picker sendiri akan menampilkan kalender dan memungkinkan user untuk menekan tampilan kalender yang berisikan tanggal untuk di user inginkan.
    Cara membuatnya:
    final selectDate = await showDatePicker (
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(2020),
        lastDate: DateTime(currentDate.year + 3),
    );

    3. Jadi saat menggunakan date picker diberikan tanggal pertama yang bisa dipilih dalam date picker. Kemudian pada lastDate, +3 artinya tanggal terakhir yang bisa dipilih dari tahun pertama tadi.

    Saat menggunakan Form picker sendiri perlu diperhatikan beberapa kondisi, seperti memastikan validasi data agar saat digunakan user saat memilih atau memasukkan sebuah nilai sesuai dengan aturan yang ditetapkan.


Atau bisa diakses melalui Link Google Docs berikut:
https://docs.google.com/document/d/1X9GuQnGXJVW8_EWzWDIhaiPNKAfEjlVAo_1pg8qqlHE/edit?usp=sharing