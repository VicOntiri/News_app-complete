import 'package:flutter/material.dart';

class CustomHeartIcon extends StatelessWidget {
  const CustomHeartIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // give it a padding of 6px all round
      padding: EdgeInsets.all(6.0),
      // use the box decoration to set the color to white
      // in the box decoration set the border radius to 50
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50.0),
      ),
      // child of the container should be an image widget
      child: Image(
        // the image widget should be of height 20 and width 20
        height: 15.0,
        width: 15.0,
        image: AssetImage(
          'assets/images/heart.png',
        ),
        // set the BoxFit to contain
        fit: BoxFit.contain,
      ),
    );
  }
}
