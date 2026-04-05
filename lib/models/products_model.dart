import 'category_model.dart';

class Product {
  final int productId;
  final String productTitle;
  final String productSlug;
  final double productPrice;
  final String productDescription;
  final List<String> productImages;
  final Category productCategory;
  final DateTime productCreationAt;
  final DateTime productUpdatedAt;

  Product({
    required this.productId,
    required this.productTitle,
    required this.productSlug,
    required this.productPrice,
    required this.productCategory,
    required this.productImages,
    required this.productDescription,
    required this.productCreationAt,
    required this.productUpdatedAt,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      productId: json['id'],
      productTitle: json['title'],
      productSlug: json['slug'],
      productPrice: (json['price'] as num).toDouble(),
      productDescription: json['description'],
      productImages: List<String>.from(json['images']),
      productCategory: Category.fromJson(json['category']),
      productCreationAt: DateTime.parse(json['creationAt']),
      productUpdatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': productId,
      'title': productTitle,
      'slug': productSlug,
      'price': productPrice,
      'description': productDescription,
      'images': productImages,
      'category': productCategory.toJson(),
      'creationAt': productCreationAt.toIso8601String(),
      'updatedAt': productUpdatedAt.toIso8601String(),
    };
  }
}