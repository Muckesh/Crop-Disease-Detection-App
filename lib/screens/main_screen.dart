import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:crop_disease_detection/constants/constants.dart';
import 'package:crop_disease_detection/screens/home_screen.dart';
import 'package:crop_disease_detection/screens/profile_screen.dart';
import 'package:crop_disease_detection/screens/scan_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _navIndex = 0;

  // List of screens

  List<Widget> screens = const [
    HomeScreen(),
    // ScanScreen(),
    ProfileScreen(),
  ];

  // List of icons

  List<IconData> iconList = [
    Icons.home,
    Icons.person,
  ];

  // List of String

  List<String> titles = [
    "Home",
    "Profile",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          // titles[_navIndex],
          "Plant Care",
          style: TextStyle(
            color: Constants.primaryColor,
            fontWeight: FontWeight.w500,
            fontSize: 30,
          ),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
      ),
      body: IndexedStack(
        index: _navIndex,
        children: screens,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            PageTransition(
                child: const ScanScreen(),
                type: PageTransitionType.bottomToTop),
          );
        },
        backgroundColor: Constants.primaryColor,
        child: Image.asset(
          'assets/images/code-scan-two.png',
          height: 30.0,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        splashColor: Constants.primaryColor,
        activeColor: Constants.primaryColor,
        inactiveColor: Colors.black.withOpacity(0.5),
        icons: iconList,
        activeIndex: _navIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        onTap: (index) {
          setState(() {
            _navIndex = index;
          });
        },
      ),
    );
  }
}
