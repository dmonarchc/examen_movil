import 'package:flutter/material.dart';
import '../models/cart_item.dart';
import '../models/productos.dart';

class CartProvider extends ChangeNotifier {
  final List<CartItem> items = [];

  List<CartItem> get cartItems => items;

  void addProduct(Listado product) {
    final index = items.indexWhere(
      (element) => element.productId == product.productId,
    );

    if (index >= 0) {
      items[index].quantity++;
    } else {
      items.add(
        CartItem(
          productId: product.productId,
          productName: product.productName,
          productPrice: product.productPrice.toDouble(),
          quantity: 1,
          productImage: product.productImage,
        ),
      );
    }

    notifyListeners();
  }

  void removeProduct(int productId) {
    items.removeWhere((element) => element.productId == productId);

    notifyListeners();
  }

  void increaseQuantity(int productId) {
    final index = items.indexWhere((element) => element.productId == productId);

    if (index >= 0) {
      items[index].quantity++;
      notifyListeners();
    }
  }

  void decreaseQuantity(int productId) {
    final index = items.indexWhere((element) => element.productId == productId);

    if (index >= 0) {
      if (items[index].quantity > 1) {
        items[index].quantity--;
      } else {
        items.removeAt(index);
      }

      notifyListeners();
    }
  }

  double get total {
    double totalPrice = 0;

    for (final item in items) {
      totalPrice += item.total;
    }

    return totalPrice;
  }

  void clearCart() {
    items.clear();
    notifyListeners();
  }
}
