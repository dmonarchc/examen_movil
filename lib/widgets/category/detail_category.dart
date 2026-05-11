import 'package:flutter/material.dart';

class DetailCategory extends StatelessWidget {
  final String categoryName;

  const DetailCategory({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 90,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: _boxDecorations(),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          categoryName,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}

BoxDecoration _boxDecorations() => const BoxDecoration(
      color: Color.fromARGB(255, 231, 50, 171),
      borderRadius: BorderRadius.all(Radius.circular(25)),
    );
