import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 30.0,
          right: 20.0,
          left: 20.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.menu,
                  size: 30.0,
                ),
                Icon(
                  Icons.person,
                  size: 30.0,
                ),
              ],
            ),
            SizedBox(
              height: 15.0,
            ),
            Text(
              'Discover',
              style: TextStyle(
                fontSize: 38.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Explore the best places in the world!',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
                color: Colors.grey,
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(width: 0.8),
                ),
                hintText: 'Search your trip',
                suffixIcon: Icon(
                  Icons.search,
                  size: 30.0,
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'All',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                Text(
                  'America',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                Text(
                  'Europe',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                Text(
                  'Asia',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                Text(
                  'Oceania',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              height: 150.0,
              width: 200.0,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: Image(
                      height: 150.0,
                      width: 200.0,
                      image: AssetImage(
                        'assets/images/taj_mahal_india_illustration.jpg',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
