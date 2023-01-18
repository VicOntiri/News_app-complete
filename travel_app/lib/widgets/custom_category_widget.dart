import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    Key? key,
    required this.title,
    required this.imageUrl,
  }) : super(key: key);

  final String title;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Image(
            height: 60.0,
            width: 60.0,
            image: AssetImage(
              imageUrl,
            ),
            fit: BoxFit.contain,
          ),
        ),
        Text(
          title,
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
