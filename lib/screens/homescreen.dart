import 'package:flutter/material.dart';
import 'package:new_pro/screens/profilescreen.dart';
import 'package:new_pro/screens/homecontentscreen.dart';
import 'package:new_pro/screens/trackerscreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _screens = [
    HomeContentScreen(),
    TrackerScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Mob-Bin'),
      // ),
      backgroundColor:const Color.fromARGB(255, 210, 255, 163),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _selectedIndex,
        selectedItemColor:  Color.fromARGB(255, 33, 143, 37),
        unselectedItemColor: Colors.black,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.track_changes),
            label: 'Tracker',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}