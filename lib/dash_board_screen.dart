// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'Screens/MyCartScreen/my_cart.dart';
import 'Screens/CategoriesScreen/categories.dart';
import 'Screens/RewardsScreen/rewards.dart';
import 'Screens/HomeScreen/homepage.dart';
import 'Utils/Images.dart';
import 'Utils/constants.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    Categories(),
    Rewards(),
    MyCart(),
    // Message(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              backgroundColor: primaryColor,
              icon: Image.asset(scale: 3, Images.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              backgroundColor: primaryColor,
              icon: Image.asset(scale: 3, Images.categories),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              backgroundColor: primaryColor,
              icon: Image.asset(
                Images.reward,
                scale: 3,
              ),
              label: 'Rewards',
            ),
            BottomNavigationBarItem(
              backgroundColor: primaryColor,
              icon: Image.asset(scale: 3, Images.cart),
              label: 'My Cart',
            ),
            // BottomNavigationBarItem(
            //   backgroundColor: primaryColor,
            //   icon: Image.asset(scale: 3, Images.message),
            //   label: 'Message',
            // ),
          ],
          currentIndex: _selectedIndex,
          unselectedItemColor: whiteColor,
          selectedItemColor: whiteColor,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
