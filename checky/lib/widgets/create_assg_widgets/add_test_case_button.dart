import 'package:checky/constants/colors.dart';
import 'package:flutter/material.dart';

class AddTestCase extends StatelessWidget {
  const AddTestCase({
    super.key,
  });

  // final String title;
  // final double? margBottom;
  // final double? margRight;
  // final double? vPadding;
  // final double? hPadding;
  // final double? height;
  // final double? width;
  // final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      // margin: EdgeInsets.only(bottom: , right:),
      width: MediaQuery.of(context).size.width,
      // height: height!,
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
        child: Icon(Icons.add),
      ),
    );
  }
}
