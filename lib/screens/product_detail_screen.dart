import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/products_model.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFECF3F4),

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text("Product Details"),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),

      body: Column(
        children: [

          /// 🔥 IMAGE SECTION
          Container(
            margin: const EdgeInsets.all(15),
            padding: const EdgeInsets.all(20),
            height: 250,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Image.network(
              product.productImage,
              fit: BoxFit.contain,
            ),
          ),

          /// 🔥 DETAILS SECTION
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(25),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  /// Title
                  Text(
                    product.productTitle,
                    style: GoogleFonts.montserrat(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  /// Price
                  Text(
                    "\$${product.productPrice.toStringAsFixed(2)}",
                    style: GoogleFonts.montserrat(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF5AA5d4),
                    ),
                  ),

                  const SizedBox(height: 10),



                  const SizedBox(height: 15),

                  /// Description Title
                  Text(
                    "Description",
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  /// Description
                  Expanded(
                    child: SingleChildScrollView(
                      child: Text(
                        product.productDescription,
                        style: GoogleFonts.montserrat(
                          fontSize: 13,
                          height: 1.5,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  /// 🔥 ADD TO CART BUTTON
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF5AA5d4),
                        foregroundColor: Colors.white,
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),

                      ),
                      child: Text(
                        "Add to Cart",
                        style: GoogleFonts.montserrat(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}