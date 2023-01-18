import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/data/data.dart';
import 'package:travel_app/models/destination.dart';
import 'package:travel_app/screens/destination_screen.dart';
import 'package:travel_app/widgets/custom_category_widget.dart';
import 'package:travel_app/widgets/custom_heart_icon.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 50.0,
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
              height: 20.0,
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
              height: 40.0,
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
              height: 40.0,
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
              height: 200.0,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: all_destinations.length,
                itemBuilder: (BuildContext context, int index) {
                  Destination destination = all_destinations[index];
                  return GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DestinationScreen(
                          singleDestination: destination,
                        ),
                      ),
                    ),
                    child: Container(
                      margin: EdgeInsets.only(right: 20.0),
                      height: 200.0,
                      width: 170.0,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20.0),
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
                                    ),
                                  ],
                                ),
                                CustomHeartIcon()
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
            SizedBox(
              height: 30.0,
            ),
            Text(
              'Popular Categories',
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CategoryWidget(
                  imageUrl: 'assets/icons/icons8-airplane-take-off-100.png',
                  title: 'Trips',
                ),
                CategoryWidget(
                  imageUrl: 'assets/icons/icons8-building-100.png',
                  title: 'Hotel',
                ),
                CategoryWidget(
                  imageUrl: 'assets/icons/icons8-car-50.png',
                  title: 'Transport',
                ),
                CategoryWidget(
                  imageUrl: 'assets/icons/icons8-confetti-100.png',
                  title: 'Events',
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        showElevation: true,
        itemCornerRadius: 24,
        curve: Curves.easeIn,
        onItemSelected: (index) => setState(() => _currentIndex = index),
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: Icon(Icons.apps),
            title: Text('Home'),
            activeColor: Colors.red,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.people),
            title: Text('Users'),
            activeColor: Colors.purpleAccent,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.message),
            title: Text(
              'Messages test for mes teset test test ',
            ),
            activeColor: Colors.pink,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.settings),
            title: Text('Settings'),
            activeColor: Colors.blue,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
