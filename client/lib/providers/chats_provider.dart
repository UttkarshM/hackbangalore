import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:http/http.dart' as http;

class ChatsNotifier extends StateNotifier<List<dynamic>> {
  ChatsNotifier() : super([]);

  final url = 'http://192.168.78.94:5000';

  Future<void> getResponse(String prompt) async {
    var geminiApiKey = await dotenv.env['GEMINI_API_KEY'].toString();
    final model = GenerativeModel(model: 'gemini-pro', apiKey: geminiApiKey);
    final content = [Content.text(prompt)];

    final response = await model.generateContent(content);

    Map<String, String?> chat = {
      'prompt': prompt,
      'response': response.text,
    };

    state = [...state, chat];
  }

  Future<void> sendPrompt(String prompt) async {
    final request = {'prompt': prompt};
    print(request);
    try {
      final response = await http.post(Uri.parse(url),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(request));
      print('here');
      final decodedResponse = jsonDecode(response.body);
      print(decodedResponse);
    } catch (error) {
      print(error);
    }
  }

  Future<void> getResponse2() async {
    try {
      final response = await http.get(Uri.parse(url));
      print('getting');

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body)['chats'];
        print(body);

        state = body;
        print(state);
      } else {
        throw Exception('failed to fetch chats');
      }
    } catch (error) {
      print(error);
    }
  }
}

final chatsProvider = StateNotifierProvider<ChatsNotifier, List<dynamic>>(
    (ref) => ChatsNotifier());
