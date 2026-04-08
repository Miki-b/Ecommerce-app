import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skillbridge_ecommerce_project/controllers/product_provider.dart';
import 'package:skillbridge_ecommerce_project/models/category_model.dart';
import 'package:skillbridge_ecommerce_project/models/products_model.dart';

class AddProductScreen extends ConsumerStatefulWidget {
  const AddProductScreen({super.key});

  @override
  ConsumerState<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends ConsumerState<AddProductScreen> {

  final _formKey = GlobalKey<FormState>();

  final titleController = TextEditingController();
  final priceController = TextEditingController();
  final descriptionController = TextEditingController();
  final imageController = TextEditingController();

  // Dropdown selected value
  String? selectedCategory;

  // List of available categories (you can fetch from API or hardcode)
  final List<String> categoryOptions = [
    "Electronics",
    "Clothing",
    "Books",
    "Home & Garden",
    "Sports",
    "Toys",
    "Other",
  ];

  final Color primaryColor = const Color(0xFF5AA5D4);

  @override
  void dispose() {
    titleController.dispose();
    priceController.dispose();
    descriptionController.dispose();
    imageController.dispose();
    super.dispose();
  }

  InputDecoration inputStyle(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: GoogleFonts.montserrat(),
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide.none,
      ),
    );
  }

  Future<void> submitProduct() async {
    if (_formKey.currentState!.validate()) {


      final product = Product(
        productId: 0,
        productTitle: titleController.text,
        productPrice: double.parse(priceController.text),
        productDescription: descriptionController.text,
        productCategory: categoryController.text,
        productImage: imageController.text,
      );


      await ref.read(productProvider.notifier).addProduct(product);

      // 🔥 Replace with API call
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFECF3F4),
      appBar: AppBar(
        title: Text(
          "Add Product",
          style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Title
              TextFormField(
                controller: titleController,
                decoration: inputStyle("Product Title"),
                validator: (value) =>
                value == null || value.isEmpty ? "Enter product title" : null,
              ),
              const SizedBox(height: 15),

              // Price
              TextFormField(
                controller: priceController,
                keyboardType: TextInputType.number,
                decoration: inputStyle("Price"),
                validator: (value) =>
                value == null || value.isEmpty ? "Enter price" : null,
              ),
              const SizedBox(height: 15),

              // Description
              TextFormField(
                controller: descriptionController,
                maxLines: 4,
                decoration: inputStyle("Description"),
                validator: (value) =>
                value == null || value.isEmpty ? "Enter description" : null,
              ),
              const SizedBox(height: 15),

              /// Category
              TextFormField(
                controller: categoryController,
                decoration: inputStyle("Category"),
                validator: (value) =>
                value!.isEmpty ? "Enter category" : null,
              ),

              const SizedBox(height: 15),

              // Image URL
              TextFormField(
                controller: imageController,
                decoration: inputStyle("Image URL"),
                validator: (value) =>
                value == null || value.isEmpty ? "Enter image URL" : null,
              ),
              const SizedBox(height: 25),

              // Submit Button
              SizedBox(
                height: 50,
                child: ElevatedButton(
                  onPressed: submitProduct,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    elevation: 3,
                  ),
                  child: Text(
                    "Add Product",
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.white
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}