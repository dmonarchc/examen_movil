import 'package:flutter/material.dart';

class DetailProvider extends StatelessWidget {
  final String providerName;

  const DetailProvider({super.key, required this.providerName});

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
          providerName,
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
      color: Color.fromARGB(255, 228, 51, 219),
      borderRadius: BorderRadius.all(Radius.circular(25)),
    );
