import 'package:flutter/material.dart';

class PopularCategory extends StatelessWidget {
  final String imageUrl;
  final String title;

  const PopularCategory({
    Key? key,
    required this.imageUrl,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(30.0),
          child: Image(
            height: 60.0,
            width: 60.0,
            image: AssetImage(
              imageUrl,
            ),
            fit: BoxFit.contain,
          ),
        ),
        Text(title)
      ],
    );
  }
}
