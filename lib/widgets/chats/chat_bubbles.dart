import 'package:swipe_to/swipe_to.dart';

import '../../providers/current_user.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/message.dart';
import 'connector.dart';
import 'bubble_body.dart';

// ignore: must_be_immutable
class ChatBubbles extends StatelessWidget {
  final Message message;
  final Message? replyTo;
  final void Function(int) drawReplyBox;
  late String messageBody;
  late int messageUserId, messageId;
  late int? threadId;

  ChatBubbles({
    super.key,
    required this.replyTo,
    required this.message,
    required this.drawReplyBox,
    this.threadId,
  }) {
    messageBody = message.body;
    messageId = message.id;
    threadId = message.threadId;
    messageUserId = message.userId;
  }

  @override
  Widget build(BuildContext context) {
    final userId = Provider.of<CurrentUser>(context).userId;
    const MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start;
    final textDirection =
        messageUserId == userId ? TextDirection.rtl : TextDirection.ltr;
    return replyTo == null
        ? Row(
            textBaseline: TextBaseline.alphabetic,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            mainAxisAlignment: mainAxisAlignment,
            textDirection: textDirection,
            children: [
              SwipeTo(
                onRightSwipe: () {
                  drawReplyBox(messageId);
                },
                child: BubbleBody(
                  body: messageBody,
                  bottomMargin: 14,
                  isParent: false,
                ),
              ),
            ],
          )
        : Column(children: [
            Row(
              textDirection: textDirection,
              textBaseline: TextBaseline.alphabetic,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              mainAxisAlignment: mainAxisAlignment,
              children: [
                messageUserId == userId
                    ? const Connector(mode: Mode.topRight)
                    : const Connector(
                        mode: Mode.topLeft,
                      ),
                BubbleBody(
                  body: replyTo?.body as String,
                  isParent: true,
                ),
              ],
            ),
            Row(
              textDirection: textDirection,
              textBaseline: TextBaseline.alphabetic,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              mainAxisAlignment: mainAxisAlignment,
              children: [
                userId == messageUserId
                    ? const Connector(mode: Mode.bottomRight)
                    : const Connector(mode: Mode.bottomLeft),
                SwipeTo(
                  onRightSwipe: () {
                    drawReplyBox(messageId);
                  },
                  child: BubbleBody(
                    body: messageBody,
                    bottomMargin: 14,
                    isParent: false,
                  ),
                ),
              ],
            )
          ]);
  }
}
