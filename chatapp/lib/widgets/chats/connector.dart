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
        height: 1,
        color: Colors.grey.withAlpha(255),
        fontWeight: FontWeight.normal);

    if (mode == Mode.topLeft) {
      return Flexible(
          child: Column(
        children: [
          Text(
            "╭\u2500",
            style: textStyle.copyWith(height: 2),
          ),
          Text(
            "\u2502 ",
            style: textStyle.copyWith(height: 1),
          ),
        ],
      ));
    } else if (mode == Mode.bottomLeft) {
      return Flexible(
        flex: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "╰\u2500",
              style: textStyle,
            ),
            Text(
              "\u2500",
              style: textStyle.copyWith(letterSpacing: -2),
            ),
            Text(
              "\ue0b1",
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
            style: textStyle.copyWith(height: 2),
          ),
          Text(" \u2502", style: textStyle.copyWith(height: 1)),
        ],
      ));
    } else {
      return Row(
        children: [
          Text(
            "\ue0b3",
            style: textStyle,
          ),
          Flexible(
            flex: 0,
            fit: FlexFit.tight,
            child: Text(
              "\u2500",
              style: textStyle.copyWith(letterSpacing: -2),
            ),
          ),
          Flexible(
            fit: FlexFit.tight,
            flex: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "\u2500╯",
                  style: textStyle,
                ),
              ],
            ),
          ),
        ],
      );
    }
  }
}
