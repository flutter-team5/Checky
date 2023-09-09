import 'package:checky/constants/colors.dart';
import 'package:checky/screens/pre_auth/app.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final supabase = Supabase.instance.client;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: CColors.darkGrey,
          title: const Text(
            "Profile",
            style: TextStyle(color: CColors.white),
          ),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.logout_outlined,
                color: CColors.white,
              ),
              onPressed: () {
                final respone = supabase.auth.signOut();
                if (respone == supabase.auth.signOut()) {
                  Navigator.pushAndRemoveUntil(context,
                      MaterialPageRoute(builder: (context) => const App()),
                      (route) {
                    return false;
                  });
                }
              },
            )
          ],
        ),
        body: Center(
          child: Column(
            children: [
              const SizedBox(height: 30),
              const CircleAvatar(
                backgroundColor: Colors.black,
                radius: 95,
                child: CircleAvatar(
                  radius: 90,
                  backgroundColor: CColors.ligthRed,
                ),
              ),
              const SizedBox(height: 30),
              GestureDetector(
                onTap: () {},
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.all(10),
                  height: 70,
                  decoration: BoxDecoration(
                    color: CColors.beige,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'My Assignments',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 10),
                      Icon(Icons.arrow_forward),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {},
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.all(10),
                  height: 70,
                  decoration: BoxDecoration(
                    color: CColors.beige,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'My Attempts',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 10),
                      Icon(Icons.arrow_forward),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
