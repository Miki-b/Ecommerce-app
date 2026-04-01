
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:skillbridge_ecommerce_project/models/products_model.dart';



class CartNotifier extends Notifier<List<Product>> {

  @override
  List<Product> build() => [];

  void addToCart(Product product) {
    state = [...state, product];
  }

  void removeFromCart(Product product) {
    state = state
        .where((p) => p.productId != product.productId)
        .toList();
  }

  double get totalPrice {
    return state.fold(0, (sum, item) => sum + item.productPrice);
  }
}

final cartProvider =
NotifierProvider<CartNotifier, List<Product>>(
  CartNotifier.new,
);

















