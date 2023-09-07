import 'package:checky/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    this.margBottom = 30,
    this.margRight = 0,
    this.vPadding = 9,
    this.hPadding = 20, this.height = 50,
  });

  final String title;
  final double? margBottom;
  final double? margRight;
  final double? vPadding;
  final double? hPadding;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: vPadding!, horizontal: hPadding!),
      margin: EdgeInsets.only(
          bottom: margBottom!, right: margRight!), 
      // width: MediaQuery.of(context).size.width * 0.35,
      height: height!,
      decoration: BoxDecoration(
        color: CColors.darkGrey,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 4,
            blurRadius: 9,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
        ),
      ),
    );
  }
}
