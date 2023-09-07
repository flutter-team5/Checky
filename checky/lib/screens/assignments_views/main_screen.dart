import 'package:checky/constants/colors.dart';
import 'package:checky/screens/assignments_views/create_assigment.dart';
import 'package:checky/screens/assignments_views/home_screen.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MainScreen extends StatefulWidget {
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<MainScreen>
    with TickerProviderStateMixin {
  var _selectedIndex = 0;

  void _handleIndexChanged(int i) {
    setState(() {
      _selectedIndex = i;
    });
  }

  List screens = [
    HomeScreen(),
    CreateAssigment(),
    HomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    var anim = AnimationController(
      vsync: this,
      value: 1,
      duration: const Duration(milliseconds: 500),
    );
    return Scaffold(
      body: screens[_selectedIndex],
      extendBody: true,
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: DotNavigationBar(
          backgroundColor: CColors.darkGrey,
          margin: EdgeInsets.only(left: 10, right: 10),
          currentIndex: _selectedIndex,
          dotIndicatorColor: Colors.white,
          unselectedItemColor: Colors.white,
          splashBorderRadius: 50,
          // enableFloatingNavBar: false,
          onTap: _handleIndexChanged,
          items: [
            /// Home
            DotNavigationBarItem(
              icon: Icon(Icons.chat),
              selectedColor: CColors.ligthRed,
            ),

            /// Profile
            DotNavigationBarItem(
              icon: Icon(Icons.home),
              selectedColor: CColors.ligthRed,
            ),
            //CHAT GPT
            DotNavigationBarItem(
              icon: Icon(Icons.person),
              selectedColor: CColors.ligthRed,
            ),
          ],
        ),
      ),
    );
  }
}

enum _SelectedTab { home, favorite, search, person }
