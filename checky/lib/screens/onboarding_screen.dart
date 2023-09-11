import 'dart:ui';
import 'package:checky/bloc/ai_assistant_bloc/ai_assistant_bloc.dart';
import 'package:checky/constants/colors.dart';
import 'package:checky/constants/spacings.dart';
import 'package:checky/widgets/AI_widgets/ai_response_dialog.dart';
import 'package:checky/widgets/custom_botton.dart';
import 'package:checky/widgets/labeld_text_field.dart';
import 'package:elegant_notification/elegant_notification.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  TextEditingController _languageController = TextEditingController();
  TextEditingController _codeController = TextEditingController();

  String chatResponse = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned(
            // height: 100,
            width: MediaQuery.of(context).size.width * 1.9,
            bottom: 200,
            left: 100,
            child:
                Image.asset("assets/backgroun/PHOTO-2023-09-10-11-35-00.jpg"),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 50,
                sigmaY: 50,
              ),
              child: const SizedBox(),
            ),
          ),
          const RiveAnimation.asset("assets/riveAssets/new_file.riv"),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 50,
                sigmaY: 50,
              ),
              child: const SizedBox(),
            ),
          ),
          SingleChildScrollView(
            child: Center(
              child: Container(
                margin: const EdgeInsets.only(left: 30, right: 30, top: 100),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Get AI Feedback",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    CSpaces.kVspace24,
                    TitledField(
                      label: 'Programming Language',
                      hintText: 'Enter the programming language',
                      controller: _languageController,
                      fieldColor: const [
                        Color.fromARGB(255, 189, 189, 189),
                        Color.fromARGB(221, 255, 255, 255)
                      ],
                    ),
                    CSpaces.kVspace16,
                    TitledField(
                      label: 'Code',
                      hintText: 'Enter your code',
                      controller: _codeController,
                      fieldColor: const [
                        Color.fromARGB(255, 189, 189, 189),
                        Color.fromARGB(221, 255, 255, 255)
                      ],
                      fieldMaxLines: 10,
                    ),
                    CSpaces.kVspace16,
                    Center(
                      child: InkWell(
                        onTap: () {
                          context.read<AiAssistantBloc>().add(
                              GetAiAssistantResponseEvent(
                                  language: _languageController.text,
                                  code: _codeController.text));
                        },
                        child: const CustomButton(
                          title: 'Ask AI',
                          fontSize: 17,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    BlocConsumer<AiAssistantBloc, AiAssistantState>(
                      listener: (context, state) {
                        if (state is GetAiAssistantResponseSuccessfulState) {
                          aiResponsDialog(context, state.aiResponse);
                        } else if (state is FailedAiAssistantResponseState) {
                          ElegantNotification.error(
                                  title: const Text("Error"),
                                  description: const Text("something went wrong"))
                              .show(context);
                        }
                      },
                      builder: (context, state) {
                        if (state is LoadingAiAssistantResponseState) {
                          return const Center(
                              child: CircularProgressIndicator(
                            color: CColors.ligthRed,
                          ));
                        }
                        return const SizedBox();
                      },
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
