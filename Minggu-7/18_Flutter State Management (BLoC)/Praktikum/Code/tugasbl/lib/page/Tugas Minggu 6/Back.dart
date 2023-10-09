import 'package:flutter/material.dart';

class BackPage extends StatelessWidget {
  const BackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HALAMAN KOSONG'),
      ),
      body: const Center(
        child: Text('Berikut ini adalah halaman yang muncul saat klik "Ya" '),
      ),
    );
  }
}
