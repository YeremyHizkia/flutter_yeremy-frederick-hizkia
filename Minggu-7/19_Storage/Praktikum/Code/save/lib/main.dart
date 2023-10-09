import 'package:flutter/material.dart';
import 'package:save/page/Splash_screen.dart';
import 'package:save/page/Welcome Page/Home.dart';
import 'package:save/page/Welcome Page/Login.dart';
import 'package:save/page/Welcome Page/Welcome.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
