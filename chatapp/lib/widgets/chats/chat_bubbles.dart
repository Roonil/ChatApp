import 'package:swipe_to/swipe_to.dart';

import '../../providers/current_user.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/message.dart';
import 'connector.dart';
import 'bubble_body.dart';

// ignore: must_be_immutable
class ChatBubbles extends StatefulWidget {
  final Message message;
  final Message? replyTo;
  final void Function(int, String) drawReplyBox;
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
  State<ChatBubbles> createState() => _ChatBubblesState();
}

class _ChatBubblesState extends State<ChatBubbles> {
  @override
  Widget build(BuildContext context) {
    final userId = Provider.of<CurrentUser>(context).userId;

    const MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start;
    final textDirection =
        widget.messageUserId == userId ? TextDirection.rtl : TextDirection.ltr;
    return widget.replyTo == null
        ? Row(
            textBaseline: TextBaseline.alphabetic,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            mainAxisAlignment: mainAxisAlignment,
            textDirection: textDirection,
            children: [
              SwipeTo(
                onRightSwipe: () {
                  widget.drawReplyBox(widget.messageId, widget.messageBody);
                },
                child: BubbleBody(
                  body: widget.messageBody,
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
                widget.messageUserId == userId
                    ? const Connector(mode: Mode.topRight)
                    : const Connector(
                        mode: Mode.topLeft,
                      ),
                BubbleBody(
                  body: widget.replyTo?.body as String,
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
                userId == widget.messageUserId
                    ? const Connector(mode: Mode.bottomRight)
                    : const Connector(mode: Mode.bottomLeft),
                SwipeTo(
                  onRightSwipe: () {
                    widget.drawReplyBox(widget.messageId, widget.messageBody);
                  },
                  child: BubbleBody(
                    body: widget.messageBody,
                    bottomMargin: 14,
                    isParent: false,
                  ),
                ),
              ],
            )
          ]);
  }
}
