// Home screen navgation will be here
import 'package:checky/bloc/assignments_bloc/assignments_bloc.dart';
import 'package:checky/constants/colors.dart';
import 'package:checky/constants/spacings.dart';
import 'package:checky/extentions/extention.dart';
import 'package:checky/screens/assignments_views/create_assigment.dart';
import 'package:checky/widgets/home_widgets/search_filed.dart';
import 'package:checky/widgets/home_widgets/card_widget_view.dart';
import 'package:checky/widgets/custom_botton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    context.read<AssignmentsBloc>().add(GetAssignmentsEvent());
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 50),
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
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 15, left: 15, bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Assignments",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      context.push(
                        screen: const CreateAssigment(),
                      );
                    },
                    child: const CustomButton(
                      title: "+ Create assg",
                      fontSize: 13,
                      margBottom: 0,
                      margRight: 10,
                      hPadding: 10,
                      width: 0.29,
                      height: 37,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        Center(
          child: SizedBox(
            height: MediaQuery.of(context).size.height - 250,
            child: ShaderMask(
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
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: BlocBuilder<AssignmentsBloc, AssignmentsState>(
                  builder: (context, state) {
                    if (state is AssignmentsLoadingState) {
                      return const Padding(
                        padding: EdgeInsets.only(top: 150.0),
                        child: Center(
                            child: CircularProgressIndicator(
                          color: CColors.red,
                        )),
                      );
                    } else if (state is NoAssignmentsFoundState) {
                      return const Text("No assignments found");
                    } else if (state is GetAssignmentsSuccessfulState) {
                      return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CSpaces.kVspace32,
                            for (var assignment in state.assignments!)
                              AssignCard(
                                assignment: assignment,
                              ),
                            CSpaces.kVspace32,
                          ]);
                    } else if (state is AssignmentsErrorState) {
                      return const Text("Something went wrong");
                    }

                    return const SizedBox();
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
