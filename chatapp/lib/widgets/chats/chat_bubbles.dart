import '../../providers/current_user.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/message.dart';
import 'connector.dart';
import 'bubble_body.dart';

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
    final userId = Provider.of<CurrentUser>(context).user.id;
    final MainAxisAlignment mainAxisAlignment = userId == messageUserId
        ? MainAxisAlignment.end
        : MainAxisAlignment.start;
    return replyTo == null
        ? Row(
            textBaseline: TextBaseline.alphabetic,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            mainAxisAlignment: mainAxisAlignment,
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
              textBaseline: TextBaseline.alphabetic,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              mainAxisAlignment: mainAxisAlignment,
              children: [
                messageUserId == userId
                    ? Container()
                    : const Connector(
                        mode: Mode.topLeft,
                      ),
                BubbleBody(
                  body: replyTo?.body as String,
                  isParent: true,
                ),
                messageUserId == userId
                    ? const Connector(mode: Mode.topRight)
                    : Container(),
              ],
            ),
            Row(
              textBaseline: TextBaseline.alphabetic,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              mainAxisAlignment: mainAxisAlignment,
              children: [
                userId == messageUserId
                    ? Container()
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
                userId == messageUserId
                    ? const Connector(mode: Mode.bottomRight)
                    : Container(),
              ],
            )
          ]);
  }
}
