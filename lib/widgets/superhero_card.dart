import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marvel_drubble/screens/details_screen.dart';
import 'package:get/get.dart';

class SuperHeroCard extends StatelessWidget {
  final String? bg;
  final String? img;
  final String? name;
  final String? realName;
  final String? desc;
  final Color? color;
  const SuperHeroCard({
    Key? key,
    this.bg,
    this.img,
    this.name,
    this.realName,
    this.desc,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 480,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(20),
              ),
            )),
        Positioned(
          top: -130,
          left: 0,
          right: 0,
          child: Hero(
            tag: 'spider',
            child: Image.asset(
              bg.toString(),
              color: Colors.white,
              fit: BoxFit.contain,
              height: 300,
              width: 300,
            ),
          ),
        ),
        Positioned(
          top: -110,
          left: 0,
          right: 0,
          child: Hero(
            tag: 'spiderman',
            child: Image.asset(
              img.toString(),
              fit: BoxFit.contain,
              height: 240,
              width: 240,
            ),
          ),
        ),
        Positioned(
            bottom: 30,
            left: 20,
            right: 20,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name.toString(),
                    style: GoogleFonts.ubuntu(
                      color: Colors.white,
                      fontSize: 40,
                      letterSpacing: -2,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    realName.toString(),
                    style: GoogleFonts.ubuntu(
                        color: Colors.grey[200], fontSize: 22),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    desc.toString(),
                    style: TextStyle(color: Colors.grey[300], wordSpacing: 2),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            )),
        Positioned(
            left: 0,
            right: 0,
            bottom: -50,
            child: GestureDetector(
              onTap: () {
                print("Tapped");
                Get.to(() => const DetailsScreen(),
                    transition: Transition.downToUp,
                    curve: Curves.decelerate,
                    gestureWidth: (context) =>
                        MediaQuery.of(context).size.width,
                    fullscreenDialog: false,
                    opaque: true,
                    preventDuplicates: true,
                    popGesture: false,
                    duration: const Duration(milliseconds: 500));
              },
              child: Container(
                padding: const EdgeInsets.only(top: 40),
                color: color,
                height: 80,
                child: Center(
                  child: IconButton(
                    icon: const Icon(
                      Icons.keyboard_arrow_up_rounded,
                      color: Colors.white,
                      size: 40,
                    ),
                    onPressed: () {
                      // print("Tapped");
                    },
                  ),
                ),
              ),
            ))
      ],
    );
  }
}
