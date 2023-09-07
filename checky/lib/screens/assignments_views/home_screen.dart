// Home screen navgation will be here
import 'package:checky/constants/spacings.dart';
import 'package:checky/screens/assignments_views/search_filed.dart';
import 'package:checky/widgets/card_widget_view.dart';
import 'package:checky/widgets/custom_botton.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 50),
            // decoration: const BoxDecoration(color: CColors.darkGrey),
            height: MediaQuery.of(context).size.height * 0.18,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/img/logo_inside.png",
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
          const Column(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 10.0, left: 10, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Assignments",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    CustomButton(
                      title: "+ Create",
                      margBottom: 5,
                      margRight: 10,
                      hPadding: 15,
                      height: 40,
                    ),
                  ],
                ),
              )
            ],
          ),
          Center(
            child: SizedBox(
              height: MediaQuery.of(context).size.height - 220,
              child: const SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    AssignCard(),
                    SizedBox(
                      height: 15,
                    ),
                    AssignCard(),
                    SizedBox(
                      height: 15,
                    ),
                    AssignCard(),
                    SizedBox(
                      height: 15,
                    ),
                    AssignCard(),
                    SizedBox(
                      height: 15,
                    ),
                    AssignCard(),
                    SizedBox(
                      height: 15,
                    ),
                    AssignCard(),
                    SizedBox(
                      height: 25,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      // bottomNavigationBar: Bottom_nav(),
    );
  }
}
