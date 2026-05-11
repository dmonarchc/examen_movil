import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Carrito de compra')),
      body: cartProvider.cartItems.isEmpty
          ? const Center(
              child: Text(
                'El carrito está vacío',
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: cartProvider.cartItems.length,
              itemBuilder: (context, index) {
                final item = cartProvider.cartItems[index];

                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    leading: item.productImage.isEmpty
                        ? const Icon(Icons.image_not_supported)
                        : Image.network(
                            item.productImage,
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                    title: Text(item.productName),
                    subtitle: Text(
                      'Precio: \$${item.productPrice.toStringAsFixed(0)}\n'
                      'Cantidad: ${item.quantity}\n'
                      'Subtotal: \$${item.total.toStringAsFixed(0)}',
                    ),
                    trailing: SizedBox(
                      width: 110,
                      child: Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: () {
                              cartProvider.decreaseQuantity(item.productId);
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () {
                              cartProvider.increaseQuantity(item.productId);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 8,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total: \$${cartProvider.total.toStringAsFixed(0)}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: cartProvider.cartItems.isEmpty
                  ? null
                  : () {
                      cartProvider.clearCart();

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Compra simulada realizada'),
                        ),
                      );

                      Navigator.of(context).pop();
                    },
              child: const Text('Comprar'),
            ),
          ],
        ),
      ),
    );
  }
}
