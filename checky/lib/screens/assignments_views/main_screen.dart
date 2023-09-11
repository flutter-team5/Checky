import 'package:checky/constants/colors.dart';
import 'package:checky/screens/assignments_views/home_screen.dart';
import 'package:checky/screens/assignments_views/profile_screen.dart';
import 'package:checky/screens/onboarding_screen.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<MainScreen> with TickerProviderStateMixin {
  var _selectedIndex = 1;

  void _handleIndexChanged(int i) {
    setState(() {
      _selectedIndex = i;
    });
  }

  List screens = [
    const OnboardingScreen(),
    const HomeScreen(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: screens[_selectedIndex],
      extendBody: true,
      bottomNavigationBar: DotNavigationBar(
        backgroundColor: CColors.darkGrey,
        margin: const EdgeInsets.only(left: 10, right: 10),
        paddingR: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        enablePaddingAnimation: false,
        currentIndex: _selectedIndex,
        dotIndicatorColor: Colors.white,
        unselectedItemColor: Colors.white,
        splashBorderRadius: 50,
        onTap: _handleIndexChanged,
        items: [
          // GPT Chat
          DotNavigationBarItem(
            icon: const Icon(Icons.chat),
            selectedColor: CColors.ligthRed,
          ),

          // Home
          DotNavigationBarItem(
            icon: const Icon(Icons.home),
            selectedColor: CColors.ligthRed,
          ),

          // Profile
          DotNavigationBarItem(
            icon: const Icon(Icons.person),
            selectedColor: CColors.ligthRed,
          ),
        ],
      ),
    );
  }
}
