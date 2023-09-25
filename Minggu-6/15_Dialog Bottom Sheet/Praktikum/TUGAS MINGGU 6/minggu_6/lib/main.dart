import 'package:flutter/material.dart';
import 'package:minggu_6/page/Contact_page/Contact_page.dart';
import 'package:minggu_6/page/Home.dart';
import 'package:minggu_6/page/Tugas Minggu 6/Gallery.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My App',
      initialRoute: '/', // Nama rute awal
      routes: {
        '/': (context) => HomePage(),
        '/gallery': (context) => GalleryPage(),
        '/contact': (context) => ContactPage(),
      },
    );
  }
}
