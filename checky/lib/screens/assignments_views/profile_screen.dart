import 'package:checky/constants/colors.dart';
import 'package:checky/constants/spacings.dart';
import 'package:checky/screens/pre_auth/app.dart';
import 'package:checky/screens/profile_screens/assignment_tab.dart';
import 'package:checky/screens/profile_screens/attempts_tab.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final supabase = Supabase.instance.client;
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.47,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: const BoxDecoration(
                color: CColors.darkGrey,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(35),
                  bottomRight: Radius.circular(35),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Profile",
                        style: TextStyle(
                          color: CColors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.logout_outlined,
                          color: CColors.white,
                          size: 30,
                        ),
                        onPressed: () {
                          final respone = supabase.auth.signOut();
                          if (respone == supabase.auth.signOut()) {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const App()),
                              (route) {
                                return false;
                              },
                            );
                          }
                        },
                      ),
                    ],
                  ),
                  CSpaces.kVspace32,
                  const CircleAvatar(
                    backgroundColor: CColors.darkGrey,
                    radius: 50,
                    child: CircleAvatar(
                      radius: 45,
                      backgroundColor: CColors.white,
                      child: Icon(
                        Icons.person,
                        color: CColors.darkGrey,
                        size: 50,
                      ),
                    ),
                  ),
                  CSpaces.kVspace16,
                  const Text(
                    "Nasser", //TODO User name will be returend here
                    style: TextStyle(
                      color: CColors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            CSpaces.kVspace24,
            const TabBar(
              labelColor: CColors.darkGrey,
              labelStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              indicatorColor: CColors.ligthRed,
              indicatorWeight: 4,
              indicatorPadding: EdgeInsets.symmetric(horizontal: 15),
              padding: EdgeInsets.symmetric(horizontal: 20),
              tabs: [
                Tab(
                  text: "Assignments",
                ),
                Tab(
                  text: "Attempts",
                ),
              ],
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  //TODO GO inside both these widgets & and add list view bulider
                  AssignmentTab(),
                  AttemptsTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
