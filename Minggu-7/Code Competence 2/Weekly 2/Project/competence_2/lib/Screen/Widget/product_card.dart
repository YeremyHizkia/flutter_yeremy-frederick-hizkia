import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String brand;
  final String imageAsset;

  const ProductCard({
    Key? key,
    required this.brand,
    required this.imageAsset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Column(
        children: [
          Image.asset(
            imageAsset,
            fit: BoxFit.cover,
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              brand,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
