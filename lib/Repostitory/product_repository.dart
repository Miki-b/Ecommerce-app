import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:skillbridge_ecommerce_project/models/products_model.dart';

class ProductRepository{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //get
  Future<List<Product>> getProducts() async {
    final snapshot = await _firestore.collection("products").get();

    return snapshot.docs.map((doc) {
      final data = doc.data();
      return Product(
        productId: (data["id"] as num?)?.toInt() ?? 0,
        productTitle: data["title"] as String? ?? "",
        productPrice: (data["price"] as num?)?.toDouble() ?? 0,
        productDescription: data["description"] as String? ?? "",
        productCategory: data["category"] as String? ?? "",
        productImage: data["image"] as String? ?? "",
      );
    }).toList();
  }




  //post
  Future<Product> createProduct(Product product) async {
    final productId = DateTime.now().millisecondsSinceEpoch;
    final productMap = {
      "id": productId,
      "title": product.productTitle,
      "price": product.productPrice,
      "description": product.productDescription,
      "category": product.productCategory,
      "image": product.productImage,
      "createdAt": FieldValue.serverTimestamp(),
    };

    await _firestore.collection("products").add(productMap);

    return Product(
      productId: productId,
      productTitle: product.productTitle,
      productPrice: product.productPrice,
      productDescription: product.productDescription,
      productCategory: product.productCategory,
      productImage: product.productImage,
    );
  }


  //update
  Future<Product> updateProduct(Product product) async {
    final query = await _firestore
        .collection("products")
        .where("id", isEqualTo: product.productId)
        .limit(1)
        .get();

    if (query.docs.isEmpty) {
      throw Exception("Product not found");
    }

    await query.docs.first.reference.update({
      "title": product.productTitle,
      "price": product.productPrice,
      "description": product.productDescription,
      "category": product.productCategory,
      "image": product.productImage,
      "updatedAt": FieldValue.serverTimestamp(),
    });

    return product;
  }

  //delete

  Future<void> deleteProduct(int id) async {
    final query = await _firestore
        .collection("products")
        .where("id", isEqualTo: id)
        .limit(1)
        .get();

    if (query.docs.isEmpty) {
      throw Exception("Product not found");
    }

    await query.docs.first.reference.delete();
  }
}