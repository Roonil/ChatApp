import 'package:flutter/material.dart';

class Connector extends StatelessWidget {
  final String connectorText;
  final bool isTopHalf;
  const Connector({
    Key? key,
    required this.connectorText,
    required this.isTopHalf,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment:
          isTopHalf ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        isTopHalf
            ? Container()
            : const Text(
                "|",
                style: TextStyle(
                  height: 0.01,
                  fontSize: 16,
                  fontFamily: "FiraCode",
                  fontWeight: FontWeight.normal,
                  color: Colors.grey,
                ),
              ),
        Row(
          children: [
            Text(
              connectorText,
              style: const TextStyle(
                fontSize: 16,
                fontFamily: "FiraCode",
                fontWeight: FontWeight.normal,
                color: Colors.grey,
              ),
            ),
            isTopHalf
                ? Card(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    color: Colors.deepPurple,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: Text(
                        "LONG LONG LONG MESSAGE",
                        style: TextStyle(
                            fontSize: 12,
                            color: Theme.of(context)
                                .primaryTextTheme
                                .bodySmall
                                ?.color),
                      ),
                    ),
                  )
                : Container()
          ],
        ),
        isTopHalf
            ? const Text(
                "|",
                style: TextStyle(
                  height: 0.01,
                  fontSize: 16,
                  fontFamily: "FiraCode",
                  fontWeight: FontWeight.normal,
                  color: Colors.grey,
                ),
              )
            : Container()
      ],
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String body;
  final bool isMine;
  const ChatBubble({super.key, required this.body, required this.isMine});

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment:
            isMine ? MainAxisAlignment.spaceBetween : MainAxisAlignment.start,
        crossAxisAlignment:
            isMine ? CrossAxisAlignment.end : CrossAxisAlignment.center,
        children: [
          isMine
              ? const Connector(
                  connectorText: "╭─",
                  isTopHalf: true,
                )
              : const Connector(
                  connectorText: "╰─\u2500\ue0b1",
                  isTopHalf: false,
                ),
          Container(
            constraints: BoxConstraints(
              maxWidth: 60 * MediaQuery.of(context).size.width / 20,
            ),
            //padding: const EdgeInsets.symmetric(vertical: 3),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              color: Colors.black38,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 2.5),
                child: Text(
                  body,
                  style: TextStyle(
                      fontSize: 16,
                      color:
                          Theme.of(context).primaryTextTheme.bodyMedium?.color),
                ),
              ),
            ),
          ),
        ]);
  }
}

class TestConnector extends StatelessWidget {
  const TestConnector({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Demo")),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            textBaseline: TextBaseline.alphabetic,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            children: [
              Flexible(
                child: Column(
                  children: [
                    Text(
                      "╭",
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: "FiraCode",
                          //height: 1.5,
                          //  leadingDistribution: TextLeadingDistribution.even,
                          color: Colors.grey.withAlpha(255),
                          fontWeight: FontWeight.normal),
                    ),
                    Text("\u2502",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                          height: 0.9,
                          fontFamily: "FiraCode",
                          color: Colors.grey.withAlpha(255),
                        )),
                  ],
                ),
              ),
              Text(
                "─",
                style: TextStyle(
                  fontSize: 16,
                  letterSpacing: -2,
                  fontFamily: "FiraCode",
                  fontWeight: FontWeight.normal,
                  color: Colors.grey.withAlpha(255),
                ),
              ),
              Container(
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.6),
                child: Card(
                  color: Colors.deepPurple,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 2.5),
                    child: Text(
                      "Sample",
                      style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).textTheme.bodySmall?.color,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            textBaseline: TextBaseline.ideographic,
            children: [
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "╰",
                      style: TextStyle(
                          fontFamily: "FiraCode",
                          fontSize: 16,
                          //   height: 1 ,
                          color: Colors.grey.withAlpha(255),
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
              Text(
                "\u2500\u2500\ue0b1",
                style: TextStyle(
                    fontSize: 16,
                    letterSpacing: -2,
                    fontWeight: FontWeight.normal,
                    fontFamily: "FiraCode",
                    color: Colors.grey.withAlpha(255)),
              ),
              Baseline(
                baseline: 16,
                baselineType: TextBaseline.alphabetic,
                child: Container(
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.6),
                  child: const Card(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.5),
                      child: Text(
                        "Paragrah Reply",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(10),
          ),
          // const ChatBubble(body: "Sup?", isMine: true),
          // const ChatBubble(body: "Yoii", isMine: false),
        ]));
  }
}
