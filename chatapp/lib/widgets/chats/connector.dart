import 'package:flutter/material.dart';

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
            "╭\u2500",
            style: textStyle,
          ),
          Text(
            "\u2502 ",
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
              "╰\u2500\u2500\ue0b1",
              style: textStyle,
            ),
          ],
        ),
      );
    } else if (mode == Mode.topRight) {
      return Flexible(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "\u2500╮",
            style: textStyle,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                " ",
                style: textStyle,
              ),
              Text("\u2502", style: textStyle.copyWith(height: 0.9)),
            ],
          ),
        ],
      ));
    } else {
      return Flexible(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "\ue0b3\u2500\u2500╯",
              style: textStyle,
            ),
          ],
        ),
      );
    }
  }
}
