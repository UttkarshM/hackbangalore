import 'package:client/providers/chats_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatItem extends ConsumerWidget {
  final int idx;
  const ChatItem({super.key, required this.idx});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;
    final chatList = ref.watch(chatsProvider);

    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Container(
            alignment: Alignment.topRight,
            constraints: BoxConstraints(minWidth: width*2/3,),
            child: Text(chatList[idx]['prompt']),
          ),
          Container(
            alignment: Alignment.topLeft,
            constraints: BoxConstraints(minWidth: width*2/3),
            child: Text(chatList[idx]['response']),
          )
        ],
      ),
    );
  }
}
