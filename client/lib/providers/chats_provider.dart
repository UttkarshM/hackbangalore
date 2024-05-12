import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class ChatsNotifier extends StateNotifier<List<dynamic>> {
  ChatsNotifier()
      : super([
          {'prompt': 'hi', 'response': 'Gemini'}
        ]);

  final url = 'http://192.168.254.94:5000/chatbot';

  Future<void> sendPrompt(String prompt) async {
    final request = {'prompt': prompt};
    print(request);
    try {
      final response = await http.post(Uri.parse(url),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(request));
      print(response.body);
      final decodedResponse = jsonDecode(response.body);
      print(decodedResponse);
    } catch (error) {
      print(error);
    }
  }

  Future<void> getResponse() async {
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
