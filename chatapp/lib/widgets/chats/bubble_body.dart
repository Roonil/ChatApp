import 'package:flutter/material.dart';

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
          color:
              isParent ? Colors.purple.shade900 : Theme.of(context).cardColor,
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
