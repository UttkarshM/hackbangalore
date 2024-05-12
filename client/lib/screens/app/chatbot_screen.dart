import 'package:client/providers/chats_provider.dart';
import 'package:client/themes/colors.dart';
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
  AppColors colors = AppColors();

  @override
  Widget build(BuildContext context) {
     var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final chatlist = ref.watch(chatsProvider);

    void sendPromptAndGetResponse() async{
      await ref.read(chatsProvider.notifier).sendPrompt(_userMessage.text);

      await ref.read(chatsProvider.notifier).getResponse();

      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ChatBot',
          style: TextStyle(color: colors.l1),
        ),
        centerTitle: true,
        elevation: 1,
        backgroundColor: colors.d2,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
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
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),  color: colors.l1,),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Start your conversation here...',
                        labelStyle: TextStyle(color: colors.d1),
                        filled: true,
                        fillColor: colors.l1,
                        border: InputBorder.none
                      ),
                      keyboardType: TextInputType.text,
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
      ),
    );
  }
}
