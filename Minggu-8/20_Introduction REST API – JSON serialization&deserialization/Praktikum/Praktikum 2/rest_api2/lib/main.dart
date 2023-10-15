import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rest_api2/Page/Home.dart';
import 'package:rest_api2/Provider/svg_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => SVGProvider(),
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
