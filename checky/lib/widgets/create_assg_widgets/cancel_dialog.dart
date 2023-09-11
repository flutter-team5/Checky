import 'package:checky/constants/colors.dart';
import 'package:checky/constants/spacings.dart';
import 'package:checky/extentions/extention.dart';
import 'package:checky/screens/assignments_views/main_screen.dart';
import 'package:checky/widgets/custom_botton.dart';
import 'package:flutter/material.dart';

cancelDialog(context) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      content: Container(
        height: 130,
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Are sure ?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              CSpaces.kVspace32,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      context.push(screen: const MainScreen());
                    },
                    child: const CustomButton(
                      title: "Yes",
                      fontSize: 16,
                      margBottom: 0,
                      margRight: 10,
                      hPadding: 5,
                      width: 0.29,
                      height: 37,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      context.pop();
                    },
                    child: const CustomButton(
                      title: "No",
                      fontSize: 16,
                      margBottom: 0,
                      margRight: 10,
                      hPadding: 5,
                      width: 0.29,
                      height: 37,
                      buttonColor: CColors.ligthRed,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
