import 'package:checky/constants/colors.dart';
import 'package:checky/constants/spacings.dart';
import 'package:checky/widgets/single_assignment_widgets/attempt_card.dart';
import 'package:flutter/material.dart';

class SingleAssignmentScreen extends StatefulWidget {
  const SingleAssignmentScreen({super.key});

  @override
  State<SingleAssignmentScreen> createState() => _SingleAssignmentScreenState();
}

class _SingleAssignmentScreenState extends State<SingleAssignmentScreen> {
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
                  CSpaces.kVspace32,
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
                          padding: const EdgeInsets.only(
                              left: 15.0, top: 10, right: 30),
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
                  CSpaces.kVspace32,
                  const Text(
                    "Privous Attempts",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  CSpaces.kVspace16,
                  Padding(
                    padding: const EdgeInsets.only(right: 5, left: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Time",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
                        ),
                        CSpaces.kHspace4,
                        const Text(
                          "Mark",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
                        ),
                        const Text(
                          "Assignment mark",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Column(
                          children: [
                            CSpaces.kVspace8,
                            const Attempt_card(),
                            CSpaces.kVspace8,
                            const Attempt_card(),
                            CSpaces.kVspace8,
                            const Attempt_card(),
                            CSpaces.kVspace8,
                            const Attempt_card(),
                            CSpaces.kVspace8,
                            const Attempt_card(),
                            CSpaces.kVspace8,
                            const Attempt_card(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: InkWell(
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.only(bottom: 30),
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
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
