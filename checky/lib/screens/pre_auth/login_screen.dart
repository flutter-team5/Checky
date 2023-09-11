import 'package:checky/constants/colors.dart';
import 'package:checky/constants/spacings.dart';
import 'package:checky/extentions/extention.dart';
import 'package:checky/screens/pre_auth/app.dart';
import 'package:checky/screens/pre_auth/sign_up_screen.dart';
import 'package:checky/widgets/labeld_text_field.dart';
import 'package:elegant_notification/elegant_notification.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

//TODO filed movement

class LogInScreen extends StatefulWidget {
  const LogInScreen({
    super.key,
  });

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final supabase = Supabase.instance.client;
    return Scaffold(
      backgroundColor: CColors.darkGrey,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
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
                    TitledField(
                        controller: emailController,
                        label: "Email",
                        hintText: "Enter your email",
                        icon: Icons.alternate_email_rounded),
                    CSpaces.kVspace24,
                    TitledField(
                      controller: passwordController,
                      label: "Password",
                      hintText: "Enter your password",
                      icon: Icons.lock_outline,
                      obscureText: true,
                    ),
                    CSpaces.kVspace32,
                    InkWell(
                      onTap: () async {
                        if ((emailController.text.isNotEmpty &&
                                emailController.text.isValidEmail) &&
                            passwordController.text.isNotEmpty) {
                          try {
                            await supabase.auth.signInWithPassword(
                              email: emailController.text,
                              password: passwordController.text,
                            );
                          } on AuthException catch (e) {
                            ElegantNotification.error(
                                    title: Text("Log in error"),
                                    description:
                                        Text("incorrict email / password"))
                                .show(context);
                          } on Exception catch (e) {
                            ElegantNotification.error(
                                    title: Text("Log in error"),
                                    description: Text("something went wrong"))
                                .show(context);
                          }
                          if (context.mounted) {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const App()),
                                (route) {
                              return false;
                            });
                          }
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
                            "Log in",
                            style: TextStyle(
                                color: CColors.white,
                                fontWeight: FontWeight.bold,
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
                          onTap: () {
                            context.push(screen: const SignUpScreen());
                          },
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
        ],
      ),
    );
  }
}
