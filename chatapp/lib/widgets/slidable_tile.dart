import 'package:flutter/material.dart';

enum SlideDirection {
  leftToRight,
  rightToLeft,
}

class SlidableTile extends StatefulWidget {
  final Widget child;
  final VoidCallback onSlided;
  SlideDirection slideDirection = SlideDirection.rightToLeft;
  final double swipeThreshold;
  SlidableTile(
      {super.key,
      required this.slideDirection,
      required this.swipeThreshold,
      required this.child,
      required this.onSlided});

  @override
  State<SlidableTile> createState() => _SlidableTileState();
}

class _SlidableTileState extends State<SlidableTile>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  double _dragExtent = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void onDragStart(DragStartDetails details) {
    setState(() {
      _dragExtent = 0;
      _controller.reset();
    });
  }

  void onDragUpdate(DragUpdateDetails details) {
    if (_controller.value < widget.swipeThreshold) {
      _dragExtent += details.primaryDelta!;
    }
    if (widget.slideDirection == SlideDirection.rightToLeft &&
        _dragExtent >= 0) {
      return;
    } else if (widget.slideDirection == SlideDirection.leftToRight &&
        _dragExtent < 0) {
      return;
    }

    setState(() {
      _controller.value = _dragExtent.abs() / context.size!.width;
    });
  }

  void onDragEnd(DragEndDetails details) {
    if (_controller.value > widget.swipeThreshold) {
      print("SIKEE");
      widget.onSlided();
    }
    _controller.fling(velocity: -1);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onHorizontalDragStart: onDragStart,
        onHorizontalDragUpdate: onDragUpdate,
        onHorizontalDragEnd: onDragEnd,
        child: AnimatedBuilder(
          animation: CurvedAnimation(
            parent: _controller,
            curve: Curves.bounceIn,
          ),
          builder: (context, child) => SlideTransition(
              position: AlwaysStoppedAnimation(Offset(
                  widget.slideDirection == SlideDirection.leftToRight
                      ? _controller.value
                      : -_controller.value,
                  0)),
              child: widget.child),
        ));
  }
}
