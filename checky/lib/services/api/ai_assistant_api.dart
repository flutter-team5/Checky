import 'dart:convert';

import 'package:http/http.dart' as http;

Future<String> sendCodeToChatGPT(String language, String code) async {
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
              'You are a helpful assistant, and if anyone sends you code, you can help identify and fix the mistakes and give him fead back. answer only to code if else return sorry you dont send code',
        },
        {'role': 'user', 'content': 'Code in $language:\n$code'}
      ]
    }),
  );

  if (response.statusCode == 200) {
    final responseData = jsonDecode(response.body);

    return responseData['choices'][0]['message']['content'];
  }

  return response.body;
}
