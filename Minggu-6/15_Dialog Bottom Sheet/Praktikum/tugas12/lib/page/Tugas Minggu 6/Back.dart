import 'package:flutter/material.dart';

class BackPage extends StatelessWidget {
  const BackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HALAMAN KOSONG'),
      ),
      body: Center(
        child: Text('Berikut ini adalah halaman yang muncul saat klik "Ya" '),
      ),
    );
  }
}
