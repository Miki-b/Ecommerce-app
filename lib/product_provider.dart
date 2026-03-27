import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skillbridge_ecommerce_project/Repostitory/product_repository.dart';
import 'package:skillbridge_ecommerce_project/models/products_model.dart';

class ProductNotifier extends AsyncNotifier<List<Product>>{

  // @override
  // int build() => 0;

  @override
  Future<List<Product>> build() async{
    return await ProductRepository().getProducts();
  }


  Future<void> addProduct(Product product) async{
    state = AsyncLoading();
    final newProduct = await ProductRepository().createProduct(product);
    state= AsyncData([...state.value!,newProduct]);
  }



  //update


  //delete
}

final productProvider  = AsyncNotifierProvider<ProductNotifier, List<Product>>(
    ProductNotifier.new
);