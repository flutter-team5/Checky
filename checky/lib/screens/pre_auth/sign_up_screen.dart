import 'package:checky/constants/colors.dart';
import 'package:checky/constants/spacings.dart';
import 'package:checky/widgets/labeld_text_field.dart';
import 'package:flutter/material.dart';


//TODO filed movement

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, //Need to be checked
      backgroundColor: CColors.lightYellow,
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
              height: MediaQuery.of(context).size.height * 0.80,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    CSpaces.kVspace16,
                    const TitledField(
                      label: "Name",
                      hintText: "Enter your name",
                      icon: Icons.person,
                      labelColor: CColors.black,
                      filled: true,
                      fillColor: CColors.white,
                    ),
                    CSpaces.kVspace16,
                    const TitledField(
                      label: "Email",
                      hintText: "Enter your email",
                      icon: Icons.alternate_email_rounded,
                      labelColor: CColors.black,
                      filled: true,
                      fillColor: CColors.white,
                    ),
                    CSpaces.kVspace16,
                    const TitledField(
                      label: "Password",
                      hintText: "Enter your password",
                      icon: Icons.lock_outline,
                      obscureText: true,
                      labelColor: CColors.black,
                      filled: true,
                      fillColor: CColors.white,
                    ),
                    CSpaces.kVspace16,
                    const TitledField(
                      label: "Password confirmation",
                      hintText: "Enter your password",
                      icon: Icons.alternate_email_rounded,
                      labelColor: CColors.black,
                      filled: true,
                      fillColor: CColors.white,
                    ),
                    CSpaces.kVspace24,
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
                            "Sign Up",
                            style: TextStyle(
                                color: CColors.white,
                                fontSize: 20,
                                fontFamily: 'ADLaMDisplay'),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 70,
            left: MediaQuery.of(context).size.width * 0.28,
            child: const Text(
              "Sign Up",
              style: TextStyle(
                fontFamily: 'ADLaMDisplay',
                fontSize: 50,
                color: CColors.black,
              ),
            ),
          ),
          Positioned(
            top: 50,
            left: MediaQuery.of(context).size.width * 0.05,
            child: InkWell(
              onTap: () {}, // TODO add pop function
              child: const Icon(Icons.arrow_back),
            ),
          ),
        ],
      ),
    );
  }
}
