import 'package:checky/constants/spacings.dart';
import 'package:checky/extentions/extention.dart';
import 'package:checky/widgets/custom_botton.dart';
import 'package:flutter/material.dart';

aiResponsDialog(context, String respons) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      content: Container(
        height: MediaQuery.of(context).size.height * 0.7,
        width: MediaQuery.of(context).size.width - 50,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  respons,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                CSpaces.kVspace32,
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: InkWell(
                    onTap: () {
                      context.pop();
                    },
                    child: const CustomButton(
                      title: "Got it :)",
                      fontSize: 16,
                      margBottom: 0,
                      margRight: 10,
                      hPadding: 5,
                      width: 0.29,
                      height: 37,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
