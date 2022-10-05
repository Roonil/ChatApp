import 'package:chatapp/models/message.dart';
import 'package:chatapp/models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Connector extends StatelessWidget {
  final int? threadId;
  final String connectorText;
  const Connector({
    Key? key,
    required this.connectorText,
    required this.threadId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      connectorText,
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Theme.of(context)
            .primaryTextTheme
            .bodyMedium
            ?.backgroundColor
            ?.withAlpha(155),
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String messageBody;
  final int messageUserId, messageId;
  final int? threadId;
  final void Function(int) replyTo;
  const ChatBubble({
    Key? key,
    required this.messageBody,
    required this.messageId,
    required this.replyTo,
    required this.threadId,
    required this.messageUserId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int userId = Provider.of<User>(context, listen: false).id;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: userId != messageUserId
          ? MainAxisAlignment.start
          : MainAxisAlignment.end,
      children: [
        userId != messageUserId
            ? Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Connector(
                  connectorText: threadId == null
                      ? "\u2500\u2500\u2500\ue0b1"
                      : "\u2500($threadId)\u2500\ue0b1",
                  threadId: threadId,
                ),
              )
            : const Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
              ),
        Container(
          constraints: BoxConstraints(
            maxWidth: 60 * MediaQuery.of(context).size.width / 100,
          ),
          padding: const EdgeInsets.symmetric(vertical: 3),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            color: Colors.black38,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Text(
                messageBody,
                style: TextStyle(
                    fontSize: 17,
                    color:
                        Theme.of(context).primaryTextTheme.bodyMedium?.color),
              ),
            ),
          ),
        ),
        userId != messageUserId
            ? IconButton(
                icon: const Icon(Icons.arrow_circle_right_outlined),
                onPressed: (() => replyTo(messageId)),
              )
            : userId == messageUserId
                ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Connector(
                      threadId: threadId,
                      connectorText: threadId == null
                          ? "\ue0b3\u2500\u2500\u2500"
                          : "\ue0b3\u2500($threadId)\u2500",
                    ),
                  )
                : const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                  )
      ],
    );
  }
}
