class Product {
  int productId;
  String productTitle;
  double productPrice;
  String productDescription;
  String productCategory;
  String productImage;


  Product({
    required this.productId,
    required this.productTitle,
    required this.productPrice,
    required this.productDescription,
    required this.productCategory,
    required this.productImage,

  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      productId: json["id"],
      productTitle: json["title"],
      productPrice: (json["price"] as num).toDouble(),
      productDescription: json["description"],
      productCategory: json["category"],
      productImage: json["image"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": productId,
      "title": productTitle,
      "price": productPrice,
      "description": productDescription,
      "category": productCategory,
      "image": productImage,

    };
  }
}