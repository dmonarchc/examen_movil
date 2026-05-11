import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/cart_provider.dart';
import 'package:flutter_application_1/screens/loadinng_screen.dart';
import 'package:flutter_application_1/services/product_service.dart';
import 'package:flutter_application_1/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../../models/productos.dart';

class ListProductScreen extends StatelessWidget {
  const ListProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productService = Provider.of<ProductService>(context);
    final cartProvider = Provider.of<CartProvider>(context);

    if (productService.isLoading) return LoadinngScreen();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Listado de productos'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, 'cart');
            },
            icon: Stack(
              children: [
                const Icon(Icons.shopping_cart),
                if (cartProvider.cartItems.isNotEmpty)
                  Positioned(
                    right: 0,
                    top: 0,
                    child: CircleAvatar(
                      radius: 7,
                      child: Text(
                        cartProvider.cartItems.length.toString(),
                        style: const TextStyle(fontSize: 9),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: productService.products.length,
        itemBuilder: (BuildContext context, index) {
          final product = productService.products[index];

          return Stack(
            children: [
              GestureDetector(
                onTap: () {
                  productService.SelectProduct = product.copy();
                  Navigator.pushNamed(context, 'edit_product');
                },
                child: CardProduct(product: product),
              ),
              Positioned(
                right: 30,
                bottom: 20,
                child: FloatingActionButton.small(
                  heroTag: 'cart_${product.productId}',
                  child: const Icon(Icons.add_shopping_cart),
                  onPressed: () {
                    cartProvider.addProduct(product);

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          '${product.productName} agregado al carrito',
                        ),
                        duration: const Duration(seconds: 1),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'addProduct',
        child: const Icon(Icons.add),
        onPressed: () {
          productService.SelectProduct = Listado(
            productId: 0,
            productName: '',
            productPrice: 0,
            productImage:
                'https://abravidro.org.br/wp-content/uploads/2015/04/sem-imagem4.jpg',
            productState: '',
          );
          Navigator.pushNamed(context, 'edit_product');
        },
      ),
    );
  }
}
