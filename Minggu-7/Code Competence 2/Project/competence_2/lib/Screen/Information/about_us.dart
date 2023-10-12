import 'package:competence_2/Screen/Widget/product_card.dart';
import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'About Us',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blue, Colors.lightBlue],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'About Us',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Hz-Diecast dengan bangga menampilkan produk Diecast dari merek terkemuka yang akan memanjakan mata Anda.',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 48),
              GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: const [
                  ProductCard(
                    brand: 'Hot Wheels',
                    imageAsset: 'Assets/images/hot_wheels.png',
                  ),
                  ProductCard(
                    brand: 'MatchBox',
                    imageAsset: 'Assets/images/Matchbox.png',
                  ),
                  ProductCard(
                    brand: 'Tomica',
                    imageAsset: 'Assets/images/Tomicas.png',
                  ),
                  ProductCard(
                    brand: 'Lego',
                    imageAsset: 'Assets/images/Lego.png',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
