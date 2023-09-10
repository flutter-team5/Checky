import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:checky/screens/assignments_views/main_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: FlutterSplashScreen.gif(
            backgroundColor: Colors.white,
            gifPath: 'assets/gifs/CHECKY.gif',
            gifWidth: MediaQuery.of(context).size.width,
            gifHeight: MediaQuery.of(context).size.width,
            defaultNextScreen: const MainScreen(),
            duration: const Duration(milliseconds: 3000),
            onInit: () async {
              debugPrint("onInit 1");
              await Future.delayed(const Duration(milliseconds: 3000));
              debugPrint("onInit 2");
            },
            onEnd: () async {
              debugPrint("onEnd 1");
              await Future.delayed(const Duration(milliseconds: 3100));
              debugPrint("onEnd 2");
            }));
  }
}
