import 'package:checky/constants/colors.dart';
import 'package:checky/constants/spacings.dart';
import 'package:flutter/material.dart';

class AssignmentsScreen extends StatelessWidget {
  const AssignmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(
                  top: 40, left: 25, right: 25, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Assignment Title",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  CSpaces.kVspace4,
                  const Text(
                    "By Publisher name",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  CSpaces.kVspace64,
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: CColors.beige,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 5.0),
                          child: Text(
                            "Description",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 15.0, top: 10, right: 30),
                          child: Text(
                            "Write a Java program to print 'Hello' on screen and your name on a separate line.",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey[600]),
                          ),
                        ),
                        const Padding(
                          padding:
                              EdgeInsets.only(left: 15.0, top: 30, right: 30),
                          child: Text(
                            "Expected Output",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              left: 15.0, top: 10, right: 30),
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 15),
                          decoration: BoxDecoration(
                              color: CColors.lightBeige,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Text(
                            "Hello\nAlexandra Abramov",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.normal),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(10),
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.579,
                    top: 10,
                    right: 30),
                width: MediaQuery.of(context).size.width * 0.35,
                height: 50,
                decoration: BoxDecoration(
                  color: CColors.darkGrey,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 4,
                      blurRadius: 9,
                      offset: const Offset(0, 5), 
                    ),
                  ],
                ),
                child: const Center(
                  child: Text(
                    "+ New submission",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
