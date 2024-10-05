import 'package:flutter/material.dart';

class ItemCards extends StatelessWidget {
  const ItemCards({
    Key? key,
    required this.imagepic,
    required this.text1,
    required this.text2,
  }) : super(key: key);

  final String imagepic; // Ensure this is a valid asset path
  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Container(
            height: 200,
            width: 150,
            decoration: BoxDecoration(
              color: const Color(0xFFE65C4F),
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(imagepic), // Check if the asset exists
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        const SizedBox(height: 5), // Use SizedBox for spacing
        Text(
          text1,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w800,
            color: Color(0xFFE65C4F),
          ),
        ),
        const SizedBox(height: 5), // Additional spacing
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text2,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xFFE65C4F).withOpacity(0.7),
              ),
            )
          ],
        ),
      ],
    );
  }
}
