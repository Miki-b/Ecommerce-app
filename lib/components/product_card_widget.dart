import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductCardWidget extends StatelessWidget {
  final String imagePath;
  final String productName;
  final double productPrice;

  const ProductCardWidget({
    super.key,
    required this.imagePath,
    required this.productName,
    required this.productPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// 🔥 Image Section
          Stack(
            children: [
              Container(
                height: 155,
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F5F5),
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(16),
                  ),
                ),
                child: Image.network(
                  imagePath,
                  fit: BoxFit.contain,
                ),
              ),

              /// ❤️ Favorite Icon
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  padding: const EdgeInsets.all(5),
                  child: const Icon(
                    Icons.favorite_border,
                    size: 18,
                    color: Color(0xFF5AA5d4),
                  ),
                ),
              ),
            ],
          ),

          /// 🔥 Text Section
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                /// Product Name
                Text(
                  productName,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.montserrat(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 6),

                /// Price
                Text(
                  "\$${productPrice.toStringAsFixed(2)}",
                  style: GoogleFonts.montserrat(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF5AA5d4),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}