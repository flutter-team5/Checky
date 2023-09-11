import 'package:checky/model/submission_model.dart';
import 'package:checky/services/database/services/assignments_services.dart';
import 'package:flutter/material.dart';

class AttemptProfileCard extends StatelessWidget {
  const AttemptProfileCard({
    super.key,
    required this.submission,
  });

  final Submission submission;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 20, left: 15),
      margin: const EdgeInsets.only(
        top: 12,
      ),
      width: MediaQuery.of(context).size.width,
      height: 50,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 254, 245, 211),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 120, 120, 120).withOpacity(0.17),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 3),
          )
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.42,
            child: FutureBuilder(
              future: getAssignmentById(submission.id!),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    snapshot.data!.assignmentTitle!,
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                }
                return SizedBox();
              },
            ),
          ),
          const SizedBox(
            width: 55,
          ),
          Text(
            "${submission.marksAquired}/${submission.marksAvailable}",
            style: TextStyle(
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
