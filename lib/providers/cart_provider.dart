import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/cart_item.dart';

// Simple provider (not using code generation to avoid generator errors)
final cartProvider = StateNotifierProvider<CartNotifier, List<CartItem>>((ref) {
  return CartNotifier();
});

class CartNotifier extends StateNotifier<List<CartItem>> {
  CartNotifier() : super([]);

  void addItem(CartItem newItem) {
    final existingIndex = state.indexWhere(
          (item) => item.productId == newItem.productId,
    );
    if (existingIndex != -1) {
      // Increase quantity if already in cart
      final updatedItem = state[existingIndex].copyWith(
        quantity: state[existingIndex].quantity + 1,
      );
      state = [
        ...state.take(existingIndex),
        updatedItem,
        ...state.skip(existingIndex + 1),
      ];
    } else {
      state = [...state, newItem];
    }
  }

  void removeFromCart(CartItem product) {
    state = state.where((item) => item.productId != product.productId).toList();
  }

  void updateQuantity(String productId, int newQuantity) {
    final index = state.indexWhere((item) => item.productId == productId);
    if (index != -1) {
      if (newQuantity <= 0) {
        state = [...state..removeAt(index)];
      } else {
        final updated = state[index].copyWith(quantity: newQuantity);
        state = [
          ...state.take(index),
          updated,
          ...state.skip(index + 1),
        ];
      }
    }
  }

  void clearCart() {
    state = [];
  }

  double get totalPrice {
    return state.fold(0, (sum, item) => sum + (item.productPrice * item.quantity));
  }
}