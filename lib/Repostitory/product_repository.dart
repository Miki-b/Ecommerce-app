import 'dart:convert';

import 'package:skillbridge_ecommerce_project/models/products_model.dart';
import 'package:http/http.dart';

class ProductRepository{
  //get
  Future<List<Product>> getProducts() async {
    final response = await get(
      Uri.parse("https://fakestoreapi.com/products"),
    );

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);

      return data.map((item) => Product.fromJson(item)).toList();
    } else {
      throw Exception("Failed to load products");
    }
  }




  //post
  Future<Product> createProduct(Product product) async {
    final response = await post(
      Uri.parse("https://fakestoreapi.com/products/${product.id}"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(product.toJson()),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return Product.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to create product");
    }
  }


  //update
  Future<Product> updateProduct(Product product) async {
    final response = await put(
      Uri.parse("https://fakestoreapi.com/products/${product.id}"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(product.toJson()),
    );

    if (response.statusCode == 200) {
      return Product.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to update product");
    }
  }

  //delete

  Future<void> deleteProduct(int id) async {
    final response = await delete(
      Uri.parse("https://fakestoreapi.com/products/$id"),
    );

    if (response.statusCode != 200) {
      throw Exception("Failed to delete product");
    }
  }
}