import 'category_model.dart';

class Product {
  final int id;
  final String title;
  final String slug;
  final double price;
  final String description;
  final List<String> images;
  final Category category;
  final DateTime creationAt;
  final DateTime updatedAt;

  Product({
    required this.id,
    required this.title,
    required this.slug,
    required this.price,
    required this.description,
    required this.images,
    required this.category,
    required this.creationAt,
    required this.updatedAt,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      slug: json['slug'],
      price: (json['price'] as num).toDouble(),
      description: json['description'],
      images: List<String>.from(json['images']),
      category: Category.fromJson(json['category']),
      creationAt: DateTime.parse(json['creationAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'slug': slug,
      'price': price,
      'description': description,
      'images': images,
      'category': category.toJson(),
      'creationAt': creationAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}