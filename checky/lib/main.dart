import 'package:checky/screens/assignments_views/home_screen.dart';
import 'package:checky/screens/assignments_views/single_assignment_screen.dart';
import 'package:checky/services/database/database_connector.dart';
import 'package:flutter/material.dart';

void main() {
  initialiseDatabase();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      //SingleAssignmentScreen(),
    );
  }
}
