import 'package:checky/constants/colors.dart';
import 'package:checky/constants/spacings.dart';
import 'package:checky/services/api/grading_api.dart';
import 'package:checky/services/database/services/assignments_services.dart';
import 'package:checky/widgets/custom_botton.dart';
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
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(0, 255, 255, 255),
        elevation: 0,
        iconTheme: const IconThemeData(color: CColors.black),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(
                  top: 10, left: 25, right: 25, bottom: 20),
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
                  ShaderMask(
                    shaderCallback: (Rect rect) {
                      return const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.white,
                          Colors.transparent,
                          Colors.transparent,
                          Colors.white
                        ],
                        stops: [
                          0.0,
                          0.1,
                          0.9,
                          1.0
                        ], // 10% purple, 80% transparent, 10% purple
                      ).createShader(rect);
                    },
                    blendMode: BlendMode.dstOut,
                    child: Container(
                      padding: EdgeInsets.only(bottom: 20),
                      height: MediaQuery.of(context).size.height * 0.72,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: [
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
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15.0, top: 10, right: 30),
                                    child: Text(
                                      "Write a Java program to print 'Hello' on screen and your name on a separate line.Write a Java program to print 'Hello' on screen and your name on a separate line.Write a Java program to print 'Hello' on screen and your name on a separate line.",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.grey[600]),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(
                                        left: 15.0, top: 30, right: 30),
                                    child: Text(
                                      "Expected Output",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
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
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: const Text(
                                      "Hello\nAlexandra Abramov",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            CSpaces.kVspace16,
                            Container(
                              padding: const EdgeInsets.only(
                                  top: 15, bottom: 5, left: 15, right: 15),
                              decoration: BoxDecoration(
                                color: CColors.butterMilk,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Previous Attempts",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  CSpaces.kVspace16,
                                  const Padding(
                                    padding: EdgeInsets.only(right: 5, left: 5),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Time",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 25.0),
                                          child: Text(
                                            "Mark",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          "Assg mark",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  CSpaces.kVspace8,
                                  Container(
                                    decoration: BoxDecoration(
                                      // border: Border(
                                      //   top: BorderSide(
                                      //     color: CColors.darkGrey,
                                      //     width: 1,
                                      //   ),
                                      // ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.17),
                                          spreadRadius: 1,
                                          blurRadius: 7,
                                          offset: const Offset(3, 0),
                                        ),
                                      ],
                                    ),
                                    width: MediaQuery.of(context).size.width,
                                    height: 125,
                                    child: ShaderMask(
                                      blendMode: BlendMode.dstOut,
                                      shaderCallback: (Rect rect) {
                                        return const LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Colors.white,
                                            Colors.transparent,
                                            Colors.transparent,
                                            Colors.white
                                          ],
                                          stops: [0.0, 0.1, 0.9, 1.0],
                                        ).createShader(rect);
                                      },
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.vertical,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 10),
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
                                  ),
                                  const Center(
                                    child: Icon(
                                      Icons.keyboard_double_arrow_down_rounded,
                                      size: 25,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // CSpaces.kVspace8,
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: InkWell(
        onTap: () async {
          uploadFileFromUser(await getAssignmentById(2));
        },
        child: const CustomButton(
          title: "+ New submission",
          margBottom: 30,
          hPadding: 5,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
    );
  }
}
