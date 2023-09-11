import 'package:checky/constants/spacings.dart';
import 'package:checky/extentions/extention.dart';
import 'package:checky/widgets/custom_botton.dart';
import 'package:flutter/material.dart';

createdSuccessDialog(context) {
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
        padding: const EdgeInsets.symmetric(
          vertical: 7,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Assignment created successfully",
                maxLines: 2,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
              CSpaces.kVspace24,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      context.pop();
                      context.pop();
                    },
                    child: const CustomButton(
                      title: "Ok",
                      fontSize: 16,
                      margBottom: 0,
                      margRight: 10,
                      hPadding: 5,
                      width: 0.29,
                      height: 37,
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
