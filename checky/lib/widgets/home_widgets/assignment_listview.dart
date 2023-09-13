import 'package:checky/bloc/assignments_bloc/assignments_bloc.dart';
import 'package:checky/constants/colors.dart';
import 'package:checky/constants/spacings.dart';
import 'package:checky/widgets/home_widgets/card_widget_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AssignmentsListView extends StatelessWidget {
  const AssignmentsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
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
                  return const Padding(
                    padding: EdgeInsets.only(top: 150),
                    child: Text(
                      "No assignments found",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: CColors.grey,
                        fontSize: 20,
                      ),
                    ),
                  );
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
                  return const Padding(
                    padding: EdgeInsets.only(top: 150),
                    child: Text(
                      "Something went wrong : (",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: CColors.grey,
                        fontSize: 20,
                      ),
                    ),
                  );
                }

                return const SizedBox();
              },
            ),
          ),
        ),
      ),
    );
  }
}
