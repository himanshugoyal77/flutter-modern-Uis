import 'package:flutter/material.dart';

class WidgetIcon extends StatelessWidget {
  const WidgetIcon({
    Key? key,
    required this.icon,
    required this.height,
    required this.width,
    this.isAllRounded = false,
  }) : super(key: key);

  final IconData icon;
  final double height;
  final double width;
  final bool isAllRounded;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            borderRadius: isAllRounded
                ? BorderRadius.circular(12)
                : const BorderRadius.only(
                    topRight: Radius.circular(12),
                    bottomRight: Radius.circular(12)),
            color: Colors.black),
        child: IconButton(
            onPressed: () {},
            icon: Icon(
              icon,
              color: Colors.white,
            )));
  }
}
