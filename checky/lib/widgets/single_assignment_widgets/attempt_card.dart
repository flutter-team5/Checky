import 'package:checky/constants/colors.dart';
import 'package:checky/model/submission_model.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class Attempt_card extends StatelessWidget {
  const Attempt_card({super.key, required this.submission});

  final Submission submission;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        right: 10,
        left: 10,
      ),
      margin: const EdgeInsets.only(top: 10),
      width: MediaQuery.of(context).size.width,
      height: 50,
      decoration: BoxDecoration(
        color: CColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.17),
            spreadRadius: 1,
            blurRadius: 7,
            offset: const Offset(0, 1),
          )
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Text(
            submission.getSubmissionTimeFormatted(),
            style: const TextStyle(
              fontSize: 15,
            ),
          ),
          const SizedBox(
            width: 55,
          ),
          Text(
            "${submission.marksAquired}",
            style: const TextStyle(
              fontSize: 15,
            ),
          ),
          const SizedBox(
            width: 110,
          ),
          Text(
            "${submission.marksAvailable}",
            style: const TextStyle(
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
