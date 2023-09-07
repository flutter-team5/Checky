// Home screen navgation will be here
import 'package:checky/constants/colors.dart';
import 'package:checky/constants/spacings.dart';
import 'package:checky/screens/assignments_views/search_filed.dart';
import 'package:checky/widgets/card_widget_view.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: CColors.darkGrey,
      //   toolbarHeight: 80,
      //   title: const Text(
      //     "Checky",
      //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
      //   ),
      //   leading: Padding(
      //     padding: const EdgeInsets.only(left: 10.0),
      //     child: Image.asset("assets/img/logo.png"),
      //   ),
      // ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 50),
            decoration: const BoxDecoration(color: CColors.darkGrey),
            height: MediaQuery.of(context).size.height * 0.2,
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/img/logo.png",
                    width: 35,
                  ),
                  CSpaces.kHspace16,
                  const Flexible(
                    child: SearchField(),
                  ),
                ],
              ),
            ),
          ),
          const Center(
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
        ],
      ),
    );
  }
}
