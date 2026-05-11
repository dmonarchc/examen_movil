import 'package:flutter/material.dart';

class DetailProduct extends StatelessWidget {
  final String productName;
  final String? price;

  const DetailProduct({super.key, required this.productName, this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: _boxDecorations(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            productName,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          if (price != null) ...[
            const SizedBox(height: 6),
            Text(
              price!,
              style: const TextStyle(fontSize: 16, color: Colors.white),
            ),
          ],
        ],
      ),
    );
  }
}

BoxDecoration _boxDecorations() => const BoxDecoration(
  color: Color.fromARGB(255, 228, 48, 219),
  borderRadius: BorderRadius.only(
    bottomLeft: Radius.circular(25),
    bottomRight: Radius.circular(25),
  ),
);
