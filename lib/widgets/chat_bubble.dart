import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String messageBody;
  const ChatBubble({
    Key? key,
    required this.messageBody,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Text(
            "\u2500(12)\u2500\ue0b1",
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Theme.of(context)
                    .primaryTextTheme
                    .bodyMedium
                    ?.color
                    ?.withAlpha(155)),
          ),
        ),
        Container(
          // constraints: const BoxConstraints(maxWidth: 400),
          constraints: BoxConstraints(
              maxWidth: 60 * MediaQuery.of(context).size.width / 100),
          padding: const EdgeInsets.symmetric(vertical: 3),
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
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
      ],
    );
  }
}
