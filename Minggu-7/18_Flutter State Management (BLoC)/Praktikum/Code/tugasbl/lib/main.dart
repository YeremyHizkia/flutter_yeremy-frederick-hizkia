import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tugasbl/Bloc/Contact_bloc.dart';
import 'package:tugasbl/page/Contact_page/Contact_page.dart';
import 'package:tugasbl/page/Tugas Minggu 6/Gallery.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<ContactBloc>(
          create: (context) => ContactBloc(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/contact': (context) => const ContactPage(),
        '/gallery': (context) => GalleryPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaman Utama'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const ListTile(
              title: Text(
                'Menu',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              title: const Text('Contact'),
              onTap: () {
                Navigator.pushNamed(context, '/contact');
              },
            ),
            ListTile(
              title: const Text('Gallery'),
              onTap: () {
                Navigator.pushNamed(context, '/gallery');
              },
            ),
          ],
        ),
      ),
    );
  }
}
