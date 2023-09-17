// Home screen navgation will be here
import 'package:checky/bloc/assignments_bloc/assignments_bloc.dart';
import 'package:checky/constants/spacings.dart';
import 'package:checky/extentions/extention.dart';
import 'package:checky/screens/assignments_views/create_assigment.dart';
import 'package:checky/services/database/services/profile_service.dart';
import 'package:checky/widgets/home_widgets/assignment_listview.dart';
import 'package:checky/widgets/home_widgets/search_filed.dart';
import 'package:checky/widgets/custom_botton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

createGitHubLogInProfile() async {
  var auth = Supabase.instance.client.auth;
  if (auth.currentUser != null) {
    if (!await doesUserProfileExist(auth.currentUser!.id)) {
      Map userProfile = new Map();
      userProfile["user_id"] = auth.currentUser!.id;
      userProfile["user_name"] =
          auth.currentSession!.user.userMetadata!["user_name"];
      insertProfile(userProfile);
    }
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    createGitHubLogInProfile();
    context.read<AssignmentsBloc>().add(GetAssignmentsEvent());
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 50),
          height: MediaQuery.of(context).size.height * 0.18,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 20.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  "assets/img/logo_inside.png",
                  width: 35,
                ),
                CSpaces.kHspace16,
                const Flexible(
                  child: SearchField(),
                ),
              ],
            ),
          ),
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 15, left: 15, bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Assignments",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      context.push(
                        screen: const CreateAssigment(),
                      );
                    },
                    child: const CustomButton(
                      title: "+ Create assg",
                      fontSize: 13,
                      margBottom: 0,
                      margRight: 10,
                      hPadding: 10,
                      width: 0.29,
                      height: 37,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        const AssignmentsListView(),
      ],
    );
  }
}

