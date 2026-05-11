class CartItem {
  CartItem({
    required this.productId,
    required this.productName,
    required this.productPrice,
    required this.quantity,
    required this.productImage,
  });

  int productId;
  String productName;
  double productPrice;
  int quantity;
  String productImage;

  double get total => productPrice * quantity;

  CartItem copy() => CartItem(
    productId: productId,
    productName: productName,
    productPrice: productPrice,
    quantity: quantity,
    productImage: productImage,
  );
}
