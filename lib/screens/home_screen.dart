import 'package:flutter/material.dart';
import 'package:skillbridge_ecommerce_project/Repostitory/product_repository.dart';
import 'package:skillbridge_ecommerce_project/components/catagory_widget.dart';
import 'package:skillbridge_ecommerce_project/components/product_card_widget.dart';
import 'package:skillbridge_ecommerce_project/models/products_model.dart';
import 'package:skillbridge_ecommerce_project/screens/product_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ProductRepository productRepository = ProductRepository();
  late Future<List<Product>> products;

  @override
  void initState() {
    super.initState();
    products = productRepository.getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Container(),
      appBar: AppBar(
        title: const Text("Hello User"),
      ),
      backgroundColor: const Color(0xFFECF3F4),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            SizedBox(
              height: 120, // 👈 REQUIRED
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  CatagoryWidget(category: "Men's clothing", image: "assets/images/mens_clothing.jpg"),
                  CatagoryWidget(category: "Women's clothing", image: "assets/images/womens_clothing.jpg"),
                  CatagoryWidget(category: "Jewelry", image: "assets/images/jewlery.jpg"),
                  CatagoryWidget(category: "Electronics", image: "assets/images/electronics.jpg"),
                ],
              ),
            ),

            /// 🔥 FutureBuilder FIXED
            Expanded(
              child: FutureBuilder<List<Product>>(
                future: products,
                builder: (context, snapshot) {

                  // Loading
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  // Error
                  if (snapshot.hasError) {
                    return Center(child: Text("Error: ${snapshot.error}"));
                  }

                  // No data
                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text("No products found"));
                  }

                  final productList = snapshot.data!;

                  return GridView.builder(
                    itemCount: productList.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 0.75,
                    ),
                    itemBuilder: (context, i) {
                      final product = productList[i];

                      return GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ProductDetailScreen(product: product),
                            ),
                          );
                        }
                        ,
                        child: ProductCardWidget(
                          imagePath: product.productImage,
                          productName: product.productTitle,
                          productPrice: product.productPrice,
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}