import 'package:flutter/material.dart';
import 'package:skillbridge_ecommerce_project/Repostitory/product_repository.dart';
import 'package:skillbridge_ecommerce_project/components/catagory_widget.dart';
import 'package:skillbridge_ecommerce_project/components/product_card_widget.dart';
import 'package:skillbridge_ecommerce_project/controllers/product_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skillbridge_ecommerce_project/screens/product_detail_screen.dart';


class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(productProvider);

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
              height: 120,
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

            Expanded(
              child: products.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (e, _) => Center(child: Text("Error: $e")),
                data: (productList) {
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