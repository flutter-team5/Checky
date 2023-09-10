import 'package:checky/constants/colors.dart';
import 'package:flutter/material.dart';

class CreatedAssgCard extends StatelessWidget {
  const CreatedAssgCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 10, left: 10),
      margin: const EdgeInsets.only(top: 10),
      width: MediaQuery.of(context).size.width,
      height: 50,
      decoration: BoxDecoration(
        color: CColors.beige,
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(27, 206, 206, 206).withOpacity(0.17),
            spreadRadius: 3,
            blurRadius: 7,
            offset: const Offset(0, 1),
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
              "Assignment titleAssignment", // TODO Add assg title
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
          Container(
            padding: const EdgeInsets.symmetric(vertical: 5),
            width: 80,
            height: 28,
            decoration: BoxDecoration(
              color: CColors.ligthRed,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              "Java", // TODO Add programming language
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'ADLaMDisplay',
                fontSize: 15,
                color: CColors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
