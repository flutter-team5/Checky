import 'package:checky/screens/assignments_views/main_screen.dart';
import 'package:checky/screens/onboarding_screen.dart';
import 'package:checky/bloc/bloc/assignments_bloc.dart';
import 'package:checky/screens/pre_auth/login_screen.dart';
import 'package:checky/services/database/database_connector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  initialiseDatabase();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => AssignmentsBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LogInScreen(),
      ),

    );
  }
}

const defaultInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(16)),
  borderSide: BorderSide(
    color: Color(0xFFDEE3F2),
    width: 1,
  ),
);
