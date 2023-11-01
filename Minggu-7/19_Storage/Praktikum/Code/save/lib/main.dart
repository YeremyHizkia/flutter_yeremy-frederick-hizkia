import 'package:flutter/material.dart';
import 'package:save/page/Splash_screen.dart';
import 'package:save/page/Welcome%20Page/home.dart';
import 'package:save/page/Welcome%20Page/login.dart';
import 'package:save/page/Welcome%20Page/welcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/welcome': (context) => WelcomePage(),
        '/login': (context) => LoginScreen(),
        '/home': (context) => HomeScreen(),
      },
      home: const SplashScreen(),
    );
  }
}
