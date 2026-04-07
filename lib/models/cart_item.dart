class CartItem {
  final String productId;
  final String productTitle;
  final double productPrice;
  final String productImage;
  int quantity;

  CartItem({
    required this.productId,
    required this.productTitle,
    required this.productPrice,
    required this.productImage,
    this.quantity = 1,
  });

  CartItem copyWith({int? quantity}) {
    return CartItem(
      productId: productId,
      productTitle: productTitle,
      productPrice: productPrice,
      productImage: productImage,
      quantity: quantity ?? this.quantity,
    );
  }
}