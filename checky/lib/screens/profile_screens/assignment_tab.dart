import 'package:checky/widgets/profile_widgets/created_assignment_card.dart';
import 'package:flutter/material.dart';

class AssignmentTab extends StatelessWidget {
  const AssignmentTab({super.key});

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
            stops: [
              0.0,
              0.09,
              0.92,
              1.0
            ], // 10% purple, 80% transparent, 10% purple
          ).createShader(rect);
        },
        blendMode: BlendMode.dstOut,
        child: const SingleChildScrollView(
          child: Column(
            children: [
              CreatedAssgCard(),
              CreatedAssgCard(),
              CreatedAssgCard(),
              CreatedAssgCard(),
              CreatedAssgCard(),
              CreatedAssgCard(),
              CreatedAssgCard(),
              CreatedAssgCard(),
            ],
          ),
        ),
      ),
    );
  }
}
