// Home screen navgation will be here

import 'package:checky/constants/colors.dart';
import 'package:checky/widgets/card_widget_view.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CColors.darkGrey,
        toolbarHeight: 100,
        title: const Text("Checky"),
      ),
      body:  const Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 10,
            ),
            AssignCard(),
            SizedBox(
              height: 10,
            ),
            AssignCard(),
            SizedBox(
              height: 10,
            ),
            AssignCard(),
            SizedBox(
              height: 10,
            ),
            AssignCard(),
          ],
        ),
      ),
    );
  }
}
