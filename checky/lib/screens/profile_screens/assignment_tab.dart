import 'package:checky/bloc/assignments_bloc/assignments_bloc.dart';
import 'package:checky/constants/colors.dart';
import 'package:checky/extentions/extention.dart';
import 'package:checky/screens/pre_auth/app.dart';
import 'package:checky/screens/pre_auth/login_screen.dart';
import 'package:checky/widgets/profile_widgets/created_assignment_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AssignmentTab extends StatelessWidget {
  const AssignmentTab({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<AssignmentsBloc>().add(GetUserAssignmentsEvent(
        userId: Supabase.instance.client.auth.currentUser!.id));
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
      margin: const EdgeInsets.only(bottom: 88),
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
              0.09,
              0.92,
              1.0
            ], // 10% purple, 80% transparent, 10% purple
          ).createShader(rect);
        },
        blendMode: BlendMode.dstOut,
        child: SingleChildScrollView(
          child: BlocBuilder<AssignmentsBloc, AssignmentsState>(
            builder: (context, state) {
              if (state is AssignmentsLoadingState) {
                return Center(
                  child: Container(
                    margin: const EdgeInsets.all(100),
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                    child: const CircularProgressIndicator(
                      color: CColors.ligthRed,
                    ),
                  ),
                );
              } else if (state is NoAssignmentsFoundState) {
                return const Padding(
                  padding: EdgeInsets.only(top: 50.0),
                  child: Center(
                    child: Text(
                      "You didn't create any assignment yet",
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                );
              } else if (state is GetAssignmentsSuccessfulState) {
                return Column(
                  children: [
                    for (var assignemnt in state.assignments!)
                      CreatedAssgCard(
                        assignment: assignemnt,
                      ),
                  ],
                );
              }
              return Text('Fix me');
            },
          ),
        ),
      ),
    );
  }
}
