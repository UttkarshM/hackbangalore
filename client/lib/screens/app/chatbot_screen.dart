import 'package:client/providers/chats_provider.dart';
import 'package:client/widgets/chat_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatScreen extends ConsumerStatefulWidget {
  const ChatScreen({super.key});

  @override
  ConsumerState<ChatScreen> createState() {
    return _ChatScreenState();
  }
}

class _ChatScreenState extends ConsumerState<ChatScreen> {
  final _userMessage = TextEditingController();
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final chatlist = ref.watch(chatsProvider);

    void sendPromptAndGetResponse() {
      ref.read(chatsProvider.notifier).sendPrompt(_userMessage.text);

      ref.read(chatsProvider.notifier).getResponse();

      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('ChatBot'),
        centerTitle: true,
        elevation: 1,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: ListView.separated(
                controller: _scrollController,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, idx) => ChatItem(idx: idx),
                  separatorBuilder: (context, idx) =>
                      const Padding(padding: EdgeInsets.only(top: 10)),
                  itemCount: chatlist.length),
            ),
          ),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 8),
            color: Colors.lightBlue,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    keyboardAppearance: Brightness.dark,
                    controller: _userMessage,
                  ),
                ),
                IconButton(
                  onPressed: sendPromptAndGetResponse,
                  icon: const Icon(Icons.send),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
