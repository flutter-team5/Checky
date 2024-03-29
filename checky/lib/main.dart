import 'package:checky/bloc/ai_assistant_bloc/ai_assistant_bloc.dart';
import 'package:checky/screens/splash_screen.dart';
import 'package:checky/bloc/assignments_bloc/assignments_bloc.dart';
import 'package:checky/bloc/submissions_bloc/submissions_bloc.dart';
import 'package:checky/services/database/database_connector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() {
  initialiseDatabase();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
   // Supabase.instance.client.auth.signOut();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AssignmentsBloc(),
        ),
        BlocProvider(
          create: (context) => SubmissionsBloc(),
        ),
        BlocProvider(
          create: (context) => AiAssistantBloc(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
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
