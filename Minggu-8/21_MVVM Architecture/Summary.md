Nama		: Yeremy Frederick Hizkia Sitorus
Program	    : Flutter - A 
Tugas		: Resume MVVM Architecture


3 poin yang saya pelajari pada materi ini:
    1. MVVM merupakan memisahkan logic dengan tampilan view kedalam viewModel, dengan memisahkan Model, View, dan ViewModel, teknik ini dapat membantu dalam pengembangan aplikasi yang lebih mudah dirawat, digunakan kembali dan mudah diuji. 

    2. Untuk mendaftarkan ViewModel dapat menggunakan MultiProvider pada umumnya agar dapat menggunakan banyak ViewModel, dan penggunaan MaterialApp sebagai child utama.

    3. Untuk menampilkan data pada view dilakukan dengan diletakkan pada bagian build dimana menggunakan metode getters yang ada pada ViewModel. 
    contohnya:
    final modelView = Provider.of<ContactViewModel>(context);

Atau bisa diakses melalui Link Google Docs berikut:
https://docs.google.com/document/d/1-jqHrT4CWF_BE5qNotYLmjweLTsbifMSZK-CyyQRkoI/edit?usp=sharing
