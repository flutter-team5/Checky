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
        height: MediaQuery.of(context).size.height * 0.4,
        width: MediaQuery.of(context).size.width - 50,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Center(
          child: Column(
            children: [
              Expanded(
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
                      CSpaces.kVspace8,
                      CSpaces.kVspace4,
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 5.0, top: 10),
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
  );
}
