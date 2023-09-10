import 'package:checky/bloc/assignments_bloc/assignments_bloc.dart';
import 'package:checky/bloc/submissions_bloc/submissions_bloc.dart';
import 'package:checky/screens/assignments_views/main_screen.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AssignmentsBloc(),
        ),
        BlocProvider(
          create: (context) => SubmissionsBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainScreen(),
      ),
    );
  }
}
