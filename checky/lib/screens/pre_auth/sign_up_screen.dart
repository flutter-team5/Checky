import 'package:checky/constants/colors.dart';
import 'package:checky/constants/spacings.dart';
import 'package:checky/extentions/extention.dart';
import 'package:checky/screens/pre_auth/app.dart';
import 'package:checky/services/database/services/profile_service.dart';
import 'package:checky/widgets/labeld_text_field.dart';
import 'package:elegant_notification/elegant_notification.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    passwordConfController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final supabase = Supabase.instance.client;
    return Scaffold(
      resizeToAvoidBottomInset: false, //Need to be checked
      backgroundColor: CColors.darkGrey,
      body: Stack(
        children: [
          Positioned(
            top: 70,
            left: MediaQuery.of(context).size.width * 0.28,
            child: const Text(
              "Sign Up",
              style: TextStyle(
                fontFamily: 'ADLaMDisplay',
                fontSize: 50,
                color: CColors.white,
              ),
            ),
          ),
          Positioned(
            top: 50,
            left: MediaQuery.of(context).size.width * 0.05,
            child: InkWell(
              onTap: () {
                context.pop();
              },
              child: const Icon(
                Icons.arrow_back,
                color: CColors.white,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.only(top: 50, left: 30, right: 30),
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(80, 0, 0, 0),
                    spreadRadius: 15,
                    blurRadius: 10,
                    offset: Offset(4, 3), // changes position of shadow
                  ),
                ],
                color: CColors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(80),
                ),
              ),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.80,
              child: Column(
                children: [
                  CSpaces.kVspace16,
                  TitledField(
                    controller: nameController,
                    label: "Name",
                    hintText: "Enter your name",
                    icon: Icons.person,
                    labelColor: CColors.darkGrey,
                  ),
                  CSpaces.kVspace16,
                  TitledField(
                    controller: emailController,
                    label: "Email",
                    hintText: "Enter your email",
                    icon: Icons.alternate_email_rounded,
                    labelColor: CColors.darkGrey,
                  ),
                  CSpaces.kVspace16,
                  TitledField(
                    controller: passwordController,
                    label: "Password",
                    hintText: "Enter your password",
                    icon: Icons.lock_outline,
                    obscureText: true,
                    labelColor: CColors.darkGrey,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  CSpaces.kVspace16,
                  TitledField(
                    controller: passwordConfController,
                    label: "Password confirmation",
                    hintText: "Enter your password",
                    icon: Icons.lock_outline,
                    labelColor: CColors.darkGrey,
                    obscureText: true,
                  ),
                  CSpaces.kVspace24,
                  InkWell(
                    onTap: () async {
                      if ((emailController.text.isNotEmpty &&
                              emailController.text.isValidEmail) &&
                          passwordController.text.isNotEmpty) {
                        try {
                          await supabase.auth.signUp(
                            email: emailController.text,
                            password: passwordController.text,
                          );
                        } on Exception catch (e) {
                          print(e);
                        }

                        // ignore: use_build_context_synchronously
                        ElegantNotification.success(
                                title: const Text("Success"),
                                description: const Text("Account Created Successfully"))
                            .show(context);

                        Map userProfile = new Map();
                        userProfile["user_id"] =
                            Supabase.instance.client.auth.currentUser!.id;
                        userProfile["user_name"] = nameController.text;
                        insertProfile(userProfile);
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const App()), (route) {
                          return false;
                        });
                      }
                    },
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
                              fontWeight: FontWeight.bold,
                              fontFamily: 'ADLaMDisplay'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

extension Email on String {
  bool get isValidEmail => RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(this);
}
