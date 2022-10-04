import 'package:flutter/material.dart';

class PrefixConnector extends StatelessWidget {
  const PrefixConnector({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "\u2500(12)\u2500\ue0b1",
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

class SuffixConnector extends StatelessWidget {
  const SuffixConnector({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "\ue0b3\u2500(12)\u2500",
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
  final int userId = 1, messageUserId;
  const ChatBubble({
    Key? key,
    required this.messageBody,
    required this.messageUserId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: userId != messageUserId
          ? MainAxisAlignment.start
          : MainAxisAlignment.end,
      children: [
        userId != messageUserId
            ? const Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: PrefixConnector(),
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
        userId == messageUserId
            ? const Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: SuffixConnector(),
              )
            : const Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
              )
      ],
    );
  }
}
