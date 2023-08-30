import 'package:checky/constants/colors.dart';
import 'package:checky/constants/spacings.dart';
import 'package:checky/widgets/labeld_text_field.dart';
import 'package:flutter/material.dart';

//TODO filed movement

class LogInScreen extends StatelessWidget {
  const LogInScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CColors.yellow,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.only(top: 50, left: 30, right: 30),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 8,
                    blurRadius: 7,
                    offset: const Offset(4, 3), // changes position of shadow
                  ),
                ],
                color: CColors.white,
                //Color.fromARGB(177, 6, 0, 71),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(80),
                ),
              ),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.75,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    const Text(
                      "Log in",
                      style: TextStyle(
                        fontFamily: 'ADLaMDisplay',
                        fontSize: 50,
                        color: CColors.black,
                      ),
                    ),
                    CSpaces.kVspace32,
                    const TitledField(
                        label: "Email",
                        hintText: "Enter your email",
                        icon: Icons.alternate_email_rounded),
                    CSpaces.kVspace24,
                    const TitledField(
                      label: "Password",
                      hintText: "Enter your password",
                      icon: Icons.lock_outline,
                      obscureText: true,
                    ),
                    CSpaces.kVspace32,
                    InkWell(
                      onTap: () {},
                      child: Container(
                        width: MediaQuery.of(context).size.width - 40,
                        height: 60,
                        decoration: BoxDecoration(
                          color: CColors.red,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const Center(
                          child: Text(
                            "Log in",
                            style: TextStyle(
                                color: CColors.white,
                                fontSize: 20,
                                fontFamily: 'ADLaMDisplay'),
                          ),
                        ),
                      ),
                    ),
                    CSpaces.kVspace64,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have any account? ",
                          style: TextStyle(
                            color: CColors.black,
                            fontFamily: 'ADLaMDisplay',
                            fontSize: 15,
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(
                              color: CColors.red,
                              fontFamily: 'ADLaMDisplay',
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Positioned(
          //   top: 120,
          //   left: MediaQuery.of(context).size.width * 0.3,
          //   child: const Text(
          //     "Log in",
          //     style: TextStyle(
          //       fontFamily: 'ADLaMDisplay',
          //       fontSize: 55,
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
