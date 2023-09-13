import 'package:checky/constants/colors.dart';
import 'package:flutter/material.dart';

class MyAttemptsScreen extends StatelessWidget {
  const MyAttemptsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CColors.darkGrey,
        title: Text("My Attempts"),
        centerTitle: true,
        
      ),
      body: SizedBox(),
    );
  }
}
