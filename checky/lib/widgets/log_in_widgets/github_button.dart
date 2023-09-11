import 'package:checky/constants/colors.dart';
import 'package:checky/constants/spacings.dart';
import 'package:flutter/material.dart';

class GithubButton extends StatelessWidget {
  const GithubButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Log in with",
          style: TextStyle(
            color: CColors.darkGrey,
            fontFamily: 'ADLaMDisplay',
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
        CSpaces.kHspace8,
        InkWell(
          onTap: () {},
          child: Row(
            children: [
              Image.asset(
                "assets/img/github.png",
                width: 20,
                height: 20,
                color: CColors.red,
              ),
              const Text(
                " GitHub",
                style: TextStyle(
                  color: CColors.red,
                  fontFamily: 'ADLaMDisplay',
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
