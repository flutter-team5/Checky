import 'dart:convert';
import 'dart:ui';
import 'package:checky/constants/spacings.dart';
import 'package:checky/widgets/AI_widgets/ai_response_dialog.dart';
import 'package:checky/widgets/custom_botton.dart';
import 'package:checky/widgets/labeld_text_field.dart';
import 'package:http/http.dart' as http;
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

  Future<void> sendCodeToChatGPT(String language, String code) async {
    const String apiKey = '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';

    final response = await http.post(
      Uri.parse('https://api.openai.com/v1/chat/completions'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey',
      },
      body: jsonEncode({
        'model': 'gpt-3.5-turbo',
        'messages': [
          {
            'role': 'system',
            'content':
                'You are a helpful assistant, and if anyone sends you code, you can help identify and fix the mistakes and give him fead back.',
          },
          {'role': 'user', 'content': 'Code in $language:\n$code'}
        ]
      }),
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      //TODO add state mangment!
      setState(() {
        chatResponse = responseData['choices'][0]['message']['content'];
      });
    }
  }

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
                          sendCodeToChatGPT(
                              _languageController.text, _codeController.text);
                          print(chatResponse);
//------------------------- IF WE WILL SHOW THE respons in a dialog insted of container  :) -----------------------------------------------
                          aiResponsDialog(context,
                              chatResponse); //TODO CHAT GPT RESPONS DIALOG
                        },
                        child: const CustomButton(
                          title: 'Ask AI',
                          fontSize: 17,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
//------------------------- IF WE WILL SHOW THE respons in a container insted of dialog :) -----------------------------------------------
                    //chatResponse
                    // FutureBuilder(
                    //   future: sendCodeToChatGPT(
                    //       _languageController.text, _codeController.text),
                    //   builder: (context, snapshot) {
                    //     if (snapshot.connectionState ==
                    //         ConnectionState.waiting) {
                    //       const Center(
                    //         child: CircularProgressIndicator(),
                    //       );
                    //     }
                    //     if (snapshot.connectionState == ConnectionState.done) {
                    //       return Container(
                    //           decoration: BoxDecoration(
                    //             color: const Color.fromARGB(143, 255, 255, 255),
                    //             border: Border.all(
                    //               color: CColors.grey,
                    //             ),
                    //             borderRadius: BorderRadius.circular(6),
                    //           ),
                    //           width: MediaQuery.of(context).size.width,
                    //           height: MediaQuery.of(context).size.height * 0.25,
                    //           padding: const EdgeInsets.all(8),
                    //           child: Text(
                    //             chatResponse,
                    //             style: const TextStyle(
                    //                 fontWeight: FontWeight.bold),
                    //           ));
                    //     } else {
                    //       return const Center(
                    //         child: CircularProgressIndicator(
                    //           color: CColors.red,
                    //         ),
                    //       );
                    //     }
                    //   },
                    // ),
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
