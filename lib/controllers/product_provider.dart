import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skillbridge_ecommerce_project/Repostitory/product_repository.dart';
import 'package:skillbridge_ecommerce_project/models/products_model.dart';

class ProductNotifier extends AsyncNotifier<List<Product>>{
  final ProductRepository _productRepository = ProductRepository();

  // @override
  // int build() => 0;

  @override
  Future<List<Product>> build() async{
    return await _productRepository.getProducts();
  }


  Future<void> addProduct(Product product) async{
    debugPrint("[ProductNotifier] addProduct -> started");
    final previousProducts = state.value ?? [];
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      try {
        final newProduct = await _productRepository.createProduct(product);
        debugPrint("[ProductNotifier] addProduct -> success");
        return [...previousProducts, newProduct];
      } catch (e) {
        debugPrint("[ProductNotifier] addProduct -> error=$e");
        rethrow;
      }
    });
  }


  Future<void> getProducts() async {
    debugPrint("[ProductNotifier] getProducts -> started");
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      try {
        final products = await _productRepository.getProducts();
        debugPrint("[ProductNotifier] getProducts -> success, count=${products.length}");
        return products;
      } catch (e) {
        debugPrint("[ProductNotifier] getProducts -> error=$e");
        rethrow;
      }
    });
  }

  //update
  Future<void> updateProduct(Product product) async {
    debugPrint("[ProductNotifier] updateProduct -> started, productId=${product.productId}");
    final previousProducts = state.value ?? [];
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      try {
        final updatedProduct = await _productRepository.updateProduct(product);
        debugPrint("[ProductNotifier] updateProduct -> success");
        return previousProducts.map((item) {
          return item.productId == updatedProduct.productId ? updatedProduct : item;
        }).toList();
      } catch (e) {
        debugPrint("[ProductNotifier] updateProduct -> error=$e");
        rethrow;
      }
    });
  }


  //delete
  Future<void> deleteProduct(int productId) async {
    debugPrint("[ProductNotifier] deleteProduct -> started, productId=$productId");
    final previousProducts = state.value ?? [];
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      try {
        await _productRepository.deleteProduct(productId);
        debugPrint("[ProductNotifier] deleteProduct -> success");
        return previousProducts
            .where((item) => item.productId != productId)
            .toList();
      } catch (e) {
        debugPrint("[ProductNotifier] deleteProduct -> error=$e");
        rethrow;
      }
    });
  }
}

final productProvider  = AsyncNotifierProvider<ProductNotifier, List<Product>>(
    ProductNotifier.new
);