import 'package:flutter/material.dart';

class CatagoryWidget extends StatelessWidget {
  CatagoryWidget({super.key, required this.category,required this.image});
  String image;
  String category;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              width: 70, // set width
              height: 70, // set height
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(image), // <-- use AssetImage
                  fit: BoxFit.cover, // optional, to fill the circle nicely
                ),
              ),
            ),
          ),
          Text(category)
        ],
      ),
    );
  }
}
