import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' as Math;
import '../constants.dart';

Widget PeopleIcons(double size, String img) {
  return Container(
    child: Stack(
      children: [
        Align(
          child: Container(
              height: size,
              width: size,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    offset: Offset(-2, 3),
                    spreadRadius: -1,
                    blurRadius: 2,
                    color: bgBlack.withOpacity(0.5),
                  )
                ],
                color: bgWhite,
                border: Border.all(
                    color: Colors.white, width: (size / 20).ceilToDouble()),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(100),
                    topRight: Radius.circular(100),
                    bottomLeft: Radius.circular(100),
                    bottomRight: Radius.circular(100)),
              ),
              child: SizedBox(
                width: 18,
                child: Stack(
                  fit: StackFit.loose,
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      bottom: -24 * (size / 50),
                      left: 0,
                      right: 0,
                      child: Icon(
                        Icons.arrow_drop_down,
                        color: Colors.white,
                        size: size - 10,
                        shadows: [
                          BoxShadow(
                            offset: Offset(-2, 3),
                            spreadRadius: -1,
                            blurRadius: 2,
                            color: Colors.grey.withOpacity(0.5),
                          )
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: SvgPicture.asset(
                        img,
                        height: size - 5,
                        width: size - 5,
                      ),
                    ),
                  ],
                ),
              )),
        ),
      ],
    ),
  );
}

class CustomClipPath extends CustomClipper<Path> {
  var radius = 10.0;
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width / 2, size.height);
    path.lineTo(size.width, 0.0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
