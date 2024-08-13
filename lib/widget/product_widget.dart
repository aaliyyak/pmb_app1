import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget {
  final String imagePath;
  final String productName;
  final String price;

  const ProductWidget({
    super.key,
    required this.imagePath,
    required this.productName,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Color(0XFF01579B),
          height: 250,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Image.asset(
              imagePath,
              fit: BoxFit.contain,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productName,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      price,
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Akreditasi',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(height: 4),
                    Image.asset(
                      "assets/Bs.png",
                      width: 50, // Adjust the size as needed
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
