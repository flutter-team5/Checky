import 'package:checky/bloc/submissions_bloc/submissions_bloc.dart';
import 'package:checky/constants/colors.dart';
import 'package:checky/constants/spacings.dart';
import 'package:checky/model/assignment_model.dart';
import 'package:checky/services/api/grading_api.dart';
import 'package:checky/services/database/services/profile_service.dart';
import 'package:checky/widgets/custom_botton.dart';
import 'package:checky/widgets/single_assignment_widgets/attempt_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SingleAssignmentScreen extends StatelessWidget {
  const SingleAssignmentScreen({super.key, required this.assignment});


  final Assignment assignment;
  @override
  Widget build(BuildContext context) {
    context.read<SubmissionsBloc>().add(GetAttemptsEvent(assignment.id!));
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
              margin: const EdgeInsets.only(top: 10, left: 25, right: 25),
              child: Column(
                //Start of the main column
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    assignment.assignmentTitle!,
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  CSpaces.kVspace4,
                  FutureBuilder(
                    future: getUserProfileById(assignment.userId!),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Text(
                          "By ${snapshot.data!.userName}",
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        );
                      }
                      return const SizedBox();
                    },
                  ),
                  CSpaces.kVspace32,
                  //Assignment Detailes Container
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
                          0.03, //Top shadow < less shadow
                          0.9,
                          1.0
                        ], // 10% purple, 80% transparent, 10% purple
                      ).createShader(rect);
                    },
                    blendMode: BlendMode.dstOut,
                    child: Container(
                      padding: const EdgeInsets.only(bottom: 20),
                      height: MediaQuery.of(context).size.height * 0.72,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          //Start of scrolling Column
                          children: [
                            Container(
                              //Start of Description container
                              width: MediaQuery.of(context).size.width,
                              margin: const EdgeInsets.only(top: 10),
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  color: CColors.lightBeige,
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
                                      assignment.assignmentDescription!,
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ), // End of Description Container
                            CSpaces.kVspace16,
                            Container(
                              //Start of Previous Attempts Container
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
                                    //Start of scrolling attempts container
                                    decoration: BoxDecoration(
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
                                    // height: 125,
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
                                          child: BlocBuilder<SubmissionsBloc,
                                              SubmissionsState>(
                                            builder: (context, state) {
                                              if (state
                                                  is AttemptsLoadingState) {
                                                return const Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                    color: CColors.white,
                                                  ),
                                                );
                                              } else if (state
                                                  is GetAttemptsSuccessfulState) {
                                                return Column(
                                                  children: [
                                                    for (final attempt
                                                        in state.submissions!)
                                                      Attempt_card(
                                                        submission: attempt,
                                                      )
                                                  ],
                                                );
                                              } else if (state
                                                  is AttemptsErrorState) {
                                                return const Center(
                                                  child: Text(
                                                      "Something went wrong"),
                                                );
                                              } else if (state
                                                  is NoAttemptsFoundState) {
                                                return const Center(
                                                  child: Text(
                                                      "No attempts found, maybe have a go at it"),
                                                );
                                              }
                                              return const SizedBox();
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ), //End of scrolling attempts container
                                  const Center(
                                    child: Icon(
                                      Icons.keyboard_double_arrow_down_rounded,
                                      size: 25,
                                    ),
                                  ),
                                ],
                              ),
                            ), //End of Previous Attempts Container
                          ],
                        ), //End of scrolling Column
                      ),
                    ),
                  ),

                  // CSpaces.kVspace8,
                ],
              ), //End of the Main coulmn
            ),
          ],
        ),
      ),
      //Upload file button
      floatingActionButton: InkWell(
        onTap: () async {
          uploadFileFromUser(assignment, context);
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
