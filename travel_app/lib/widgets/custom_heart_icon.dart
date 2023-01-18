import 'package:flutter/material.dart';

class CustomHeartIcon extends StatelessWidget {
  const CustomHeartIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50.0),
      ),
      child: Image(
        height: 15.0,
        width: 15.0,
        image: AssetImage(
          'assets/images/heart.png',
        ),
        fit: BoxFit.contain,
      ),
    );
  }
}
