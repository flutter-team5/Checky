import 'package:checky/widgets/profile_widgets/profile_attempt_card.dart';
import 'package:flutter/material.dart';

class AttemptsTab extends StatelessWidget {
  const AttemptsTab({super.key});

  @override
  Widget build(BuildContext context) {
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
        child: const SingleChildScrollView(
          child: Column(
            children: [
              AttemptProfileCard(),
              AttemptProfileCard(),
              AttemptProfileCard(),
              AttemptProfileCard(),
              AttemptProfileCard(),
              AttemptProfileCard(),
              AttemptProfileCard(),
              AttemptProfileCard(),
            ],
          ),
        ),
      ),
    );
  }
}
