import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:travel_app/models/destination.dart';
import 'package:travel_app/widgets/custom_heart_icon.dart';

class DestinationScreen extends StatelessWidget {
  final Destination singleDestination;

  const DestinationScreen({
    super.key,
    required this.singleDestination,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image(
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width,
            image: AssetImage(
              singleDestination.detailsImageUrl,
            ),
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 30.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.arrow_back,
                  size: 30.0,
                  color: Colors.white,
                ),
                CustomHeartIcon(),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.only(top: 20.0),
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.4,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35.0),
                topRight: Radius.circular(35.0),
              ),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          singleDestination.title,
                          style: TextStyle(
                            fontSize: 28.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text('⭐ ${singleDestination.rating}', style: Textsyle,)
                      ],
                    ),
                    Column()
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
