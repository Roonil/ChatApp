import 'package:flutter/material.dart';

class PostAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final Widget center;

  const PostAppBar({
    Key? key,
    required this.height,
    required this.center,
    //this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      height: height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Align(
              child: center,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
