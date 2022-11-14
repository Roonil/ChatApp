import 'package:chatapp/models/message.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'chat_bubbles.dart';

class MessagesList extends StatelessWidget {
  final List<Message> messages;
  final ItemScrollController messageListController;
  final void Function(int) drawReplyBox;

  const MessagesList({
    Key? key,
    required this.messageListController,
    required this.drawReplyBox,
    required this.messages,
  }) : super(key: key);

  @override
  @override
  Widget build(BuildContext context) {
    //final controller = ScrollController(initialScrollOffset: 0);
    // SchedulerBinding.instance.addPostFrameCallback((_) {
    //   messageListController
    //       .jumpTo(messageListController.position.maxScrollExtent);
    // });
    return Padding(
      padding: const EdgeInsets.only(bottom: 0),
      child: ScrollablePositionedList.builder(
        reverse: true,
        shrinkWrap: true,
        itemScrollController: messageListController,
        itemBuilder: (BuildContext context, int index) {
          int indexRev = messages.length <= 1 ? 0 : messages.length - index - 1;

          return ChatBubbles(
            message: messages[indexRev],
            drawReplyBox: drawReplyBox,
            replyTo: messages.isEmpty
                ? null
                : messages.firstWhereOrNull(
                    (message) => message.id == messages[indexRev].responseTo),
          );
        },
        itemCount: messages.length,
      ),
    );
  }
}
