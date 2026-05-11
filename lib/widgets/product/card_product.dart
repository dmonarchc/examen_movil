import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/product/detail_product.dart';
import 'package:flutter_application_1/widgets/product/image_product.dart';

import '../../models/productos.dart' show Listado;

class CardProduct extends StatelessWidget {
  final Listado product;

  const CardProduct({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        margin: const EdgeInsets.only(top: 30, bottom: 10),
        width: double.infinity,
        height: 400,
        decoration: _cardDecoration(),
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
                child: ImageProduct(url: product.productImage),
              ),
            ),

            DetailProduct(
              productName: product.productName,
              price: '\$${product.productPrice}',
            ),
          ],
        ),
      ),
    );
  }
}

BoxDecoration _cardDecoration() => BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(25),
  boxShadow: const [
    BoxShadow(color: Colors.black26, offset: Offset(0, 5), blurRadius: 10),
  ],
);
