import 'package:flutter/material.dart';

class AttemptProfileCard extends StatelessWidget {
  const AttemptProfileCard({
    super.key,
  });

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
            child: const Text(
              "Assignment title", //TODO assg title returend here
              maxLines: 2,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            width: 55,
          ),
          const Text(
            "5/5",
            style: TextStyle(
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
