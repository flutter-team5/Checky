import 'package:checky/bloc/submissions_bloc/submissions_bloc.dart';
import 'package:checky/widgets/profile_widgets/profile_attempt_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AttemptsTab extends StatelessWidget {
  const AttemptsTab({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<SubmissionsBloc>().add(GetAllUserAttemptsEvent(
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
            stops: [0.0, 0.09, 0.92, 1.0],
          ).createShader(rect);
        },
        blendMode: BlendMode.dstOut,
        child: SingleChildScrollView(
          child: BlocBuilder<SubmissionsBloc, SubmissionsState>(
            builder: (context, state) {
              if (state is AttemptsLoadingState) {
                return CircularProgressIndicator();
              } else if (state is NoAttemptsFoundState) {
                return Text("No attempts found");
              } else if (state is GetAttemptsSuccessfulState) {
                return Column(
                  children: [
                    for (final attempt in state.submissions!)
                      AttemptProfileCard(submission: attempt)
                  ],
                );
              }
              return SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
