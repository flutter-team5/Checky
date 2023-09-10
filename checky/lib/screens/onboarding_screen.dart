import 'dart:convert';
import 'dart:ui';
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
    final String apiKey = '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';

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
              child: SizedBox(),
            ),
          ),
          RiveAnimation.asset("assets/riveAssets/new_file.riv"),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 50,
                sigmaY: 50,
              ),
              child: SizedBox(),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _languageController,
                  decoration: const InputDecoration(
                      labelText: 'Enter the programming language',
                      labelStyle: TextStyle()),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: _codeController,
                  decoration:
                      const InputDecoration(labelText: 'Enter your code'),
                  maxLines: 6,
                ),
                ElevatedButton(
                  onPressed: () {
                    sendCodeToChatGPT(
                        _languageController.text, _codeController.text);
                  },
                  child: const Text('Send'),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Ai assistant:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                //chatResponse

                Container(
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(6)),
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    chatResponse,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )

                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
