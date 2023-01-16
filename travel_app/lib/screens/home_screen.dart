import 'package:flutter/material.dart';
import 'package:travel_app/data/data.dart';
import 'package:travel_app/models/destination.dart';
import 'package:travel_app/screens/destination_screen.dart';

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
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: all_destinations.length,
                itemBuilder: (BuildContext context, int index) {
                  Destination destination = all_destinations[index];
                  return GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DestinationScreen(),
                      ),
                    ),
                    child: Container(
                      margin: EdgeInsets.only(right: 20.0),
                      height: 200.0,
                      width: 170.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image(
                              height: 200.0,
                              width: 170.0,
                              image: AssetImage(
                                destination.mainImageUrl,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 160.0),
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      destination.title,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      'Starting at \$${destination.price}',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                                Container(
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
                                    height: 20.0,
                                    width: 20.0,
                                    image: AssetImage(
                                      'assets/images/heart.png',
                                    ),
                                    // set the BoxFit to contain
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
