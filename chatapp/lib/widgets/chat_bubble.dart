import 'package:chatapp/providers/current_user.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../models/message.dart';

enum Mode {
  topLeft,
  topRight,
  bottomLeft,
  bottomRight,
}

class Connector extends StatelessWidget {
  final Mode mode;
  const Connector({
    super.key,
    required this.mode,
  });

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = TextStyle(
        fontFamily: "FiraCode",
        fontSize: 16,
        color: Colors.grey.withAlpha(255),
        fontWeight: FontWeight.normal);

    if (mode == Mode.topLeft) {
      return Flexible(
          child: Column(
        children: [
          Text(
            "╭",
            style: textStyle,
          ),
          Text(
            "\u2502",
            style: textStyle.copyWith(height: 0.9),
          ),
        ],
      ));
    } else if (mode == Mode.bottomLeft) {
      return Flexible(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "╰",
              style: textStyle,
            ),
          ],
        ),
      );
    } else if (mode == Mode.topRight) {
      return Flexible(
          child: Column(
        children: [
          Text(
            "╮",
            style: textStyle,
          ),
          Text("\u2502", style: textStyle.copyWith(height: 0.9)),
        ],
      ));
    } else {
      return Flexible(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "╯",
              style: textStyle,
            ),
          ],
        ),
      );
    }
  }
}

class BubbleBody extends StatelessWidget {
  final String body;
  final bool isParent;
  final double? bottomMargin;

  const BubbleBody(
      {super.key,
      this.bottomMargin,
      required this.isParent,
      required this.body});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints:
          BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.6),
      child: Card(
          color: isParent ? Colors.deepPurple : Theme.of(context).cardColor,
          margin: EdgeInsets.only(
              bottom: bottomMargin ?? 4, top: 4, left: 4, right: 4),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2.5),
            child: Text(
              maxLines: isParent ? 1 : null,
              overflow: isParent ? TextOverflow.ellipsis : null,
              body,
              style: const TextStyle(fontSize: 16),
            ),
          )),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final Message message;
  // final Message? nextMessage;
  final Message? replyTo;
  final void Function(int) drawReplyBox;
  late String messageBody;
  late int messageUserId, messageId;
  late int? threadId;

  ChatBubble({
    super.key,
    //  required this.nextMessage,
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
    final TextStyle textStyle = TextStyle(
      fontSize: 16,
      letterSpacing: -2,
      fontFamily: "FiraCode",
      fontWeight: FontWeight.normal,
      color: Colors.grey.withAlpha(255),
    );
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
              BubbleBody(
                body: messageBody,
                bottomMargin: 14,
                isParent: false,
              ),
              messageUserId == userId
                  ? Container()
                  : IconButton(
                      icon: const Icon(Icons.arrow_circle_right_outlined),
                      onPressed: (() => drawReplyBox(messageId)),
                    )
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
                messageUserId == userId
                    ? Container()
                    : Text(
                        "─",
                        style: textStyle,
                      ),
                BubbleBody(
                  body: replyTo?.body as String,
                  isParent: true,
                ),
                messageUserId == userId
                    ? Text(
                        "─",
                        style: textStyle,
                      )
                    : Container(),
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
                userId == messageUserId
                    ? Container()
                    : Text(
                        "\u2500\u2500\ue0b1",
                        style: textStyle,
                      ),
                BubbleBody(
                  body: messageBody,
                  bottomMargin: 14,
                  isParent: false,
                ),
                userId == messageUserId
                    ? Text(
                        "\ue0b3\u2500\u2500",
                        style: textStyle,
                      )
                    : Container(),
                userId == messageUserId
                    ? const Connector(mode: Mode.bottomRight)
                    : Container(),
              ],
            )
          ]);
  }
}
