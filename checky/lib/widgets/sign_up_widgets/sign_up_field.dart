import 'package:checky/constants/colors.dart';
import 'package:checky/constants/spacings.dart';
import 'package:checky/screens/pre_auth/app.dart';
import 'package:checky/screens/pre_auth/sign_up_screen.dart';
import 'package:checky/services/database/services/profile_service.dart';
import 'package:checky/widgets/labeld_text_field.dart';
import 'package:elegant_notification/elegant_notification.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignupFields extends StatelessWidget {
  const SignupFields({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.passwordConfController,
    required this.supabase,
  });

  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController passwordConfController;
  final SupabaseClient supabase;

  @override
  Widget build(BuildContext context) {
    return Column(
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
              // ignore: use_build_context_synchronously
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
    );
  }
}
