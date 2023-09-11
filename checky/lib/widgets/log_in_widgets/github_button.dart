import 'package:checky/constants/colors.dart';
import 'package:checky/constants/spacings.dart';
import 'package:checky/screens/assignments_views/main_screen.dart';
import 'package:checky/screens/pre_auth/app.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class GithubButton extends StatelessWidget {
  const GithubButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final supabase = Supabase.instance.client;
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
          onTap: () {
            final respone = supabase.auth.signInWithOAuth(Provider.github);
            if (respone != null) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MainScreen()));
            }

            // if (context.mounted) {
            //   Navigator.pushAndRemoveUntil(
            //       context, MaterialPageRoute(builder: (context) => const App()),
            //       (route) {
            //     return false;
            //   });
            // }
          },
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

Future loginWithGithub({required BuildContext context}) async {}


// () {
//                           final respone = supabase.auth.signOut();
//                           if (respone == supabase.auth.signOut()) {
//                             Navigator.pushAndRemoveUntil(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => const App()),
//                               (route) {
//                                 return false;
//                               },
//                             );
//                           } else {
//                             context.push(screen: LogInScreen());
//                           }
//                         },