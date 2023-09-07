import 'package:checky/constants/colors.dart';
import 'package:checky/constants/spacings.dart';
import 'package:flutter/material.dart';

class AssignCard extends StatelessWidget {
  const AssignCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: CColors.beige,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              spreadRadius: 2,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        width: MediaQuery.of(context).size.width - 20,
        height: MediaQuery.of(context).size.height * 0.16,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Assignment title",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'ADLaMDisplay',
                      fontSize: 20,
                    ),
                  ),
                  CSpaces.kVspace8,
                  const Text(
                    "Assiignment Description Assiignment Description Assiignment Description Assiignment Description",
                    maxLines: 2,
                    style: TextStyle(
                      fontFamily: 'ADLaMDisplay',
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 3),
              width: 80,
              height: 28,
              decoration: BoxDecoration(
                color: CColors.ligthRed,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                "Python",
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
      ),
    );
  }
}
