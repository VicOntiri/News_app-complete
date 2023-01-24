import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:furniture_app/data/data.dart';
import 'package:furniture_app/models/furniture.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30.0,
          vertical: 40.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Furniture \nin your style',
              style: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  height: 150.0,
                  width: MediaQuery.of(context).size.width,
                  // margin: EdgeInsets.only(top: 50.0),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Text('Elegant\nwhite chair'),
                        Text('\$ 200'),
                      ],
                    ),
                    // TODO: implement image here
                  ],
                ),
              ],
            ),
            ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: chairs.length,
              itemBuilder: (BuildContext context, int index) {
                Furniture chair = chairs[index];
                return GestureDetector(
                  onTap: () {},
                  child: Container(),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
