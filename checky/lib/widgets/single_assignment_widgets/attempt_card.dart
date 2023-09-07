import 'package:checky/constants/colors.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class Attempt_card extends StatelessWidget {
  const Attempt_card({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 10, left: 10),
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
      child: const Row(
        children: [
          Text(
            "01 Mar 2023",
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          SizedBox(
            width: 55,
          ),
          Text(
            "5",
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          SizedBox(
            width: 110,
          ),
          Text(
            "5",
            style: TextStyle(
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
