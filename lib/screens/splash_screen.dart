import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:friends/constants.dart';
import 'package:friends/screens/home_screen.dart';
import 'package:friends/widgets/people_icons.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late AnimationController _animationController1;
  late AnimationController _animationController2;
  late AnimationController _animationController3;
  late AnimationController _animationController4;
  late AnimationController _animationController5;
  late AnimationController _animationController6;
  late AnimationController _animationController7;
  late AnimationController _animationController8,
      _animationController9,
      _animationController10,
      _animationController11;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryDark,
      body: Padding(
        padding: const EdgeInsets.only(top: 150),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: SizedBox(
                height: 300,
                width: 300,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      top: -30,
                      left: -10,
                      right: -10,
                      bottom: -50,
                      // alignment: Alignment.center,
                      child: FadeIn(
                        controller: (controller) =>
                            _animationController1 = controller,
                        child: Transform.rotate(
                          angle: 0,
                          child: Container(
                            alignment: Alignment.center,
                            height: 240,
                            width: 240,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              image: const DecorationImage(
                                image: AssetImage(
                                  'assets/lines_bg.png',
                                ),
                                opacity: 0.5,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: -30,
                      left: -10,
                      right: -10,
                      bottom: -40,
                      // alignment: Alignment.center,
                      child: FadeIn(
                        controller: (controller) =>
                            _animationController2 = controller,
                        child: Transform.rotate(
                          angle: 0.5,
                          child: Container(
                            alignment: Alignment.center,
                            height: 300,
                            width: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              image: const DecorationImage(
                                image: AssetImage(
                                  'assets/lines_bg.png',
                                ),
                                opacity: 0.5,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: FadeIn(
                        controller: (controller) =>
                            _animationController3 = controller,
                        child: SizedBox(
                          height: 210,
                          width: 210,
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 210,
                                  width: 210,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    image: const DecorationImage(
                                      image: AssetImage('assets/maps.jpg'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: -20,
                                left: 30,
                                child: FadeIn(
                                  controller: (controller) =>
                                      _animationController4 = controller,
                                  delay: const Duration(seconds: 1),
                                  child: ElasticIn(
                                      delay: const Duration(seconds: 2),
                                      child: PeopleIcons(
                                          80, 'assets/avatar1.svg')),
                                ),
                              ),
                              Positioned(
                                top: 20,
                                right: -10,
                                child: FadeIn(
                                  controller: (controller) =>
                                      _animationController5 = controller,
                                  delay: const Duration(seconds: 1),
                                  child: Transform.rotate(
                                    angle: 0.2,
                                    child: ElasticIn(
                                        delay: const Duration(seconds: 2),
                                        child: PeopleIcons(
                                            50, 'assets/avatar2.svg')),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 30,
                                right: 20,
                                child: FadeIn(
                                  controller: (p0) =>
                                      _animationController6 = p0,
                                  delay: const Duration(seconds: 1),
                                  child: Transform.rotate(
                                    angle: 0,
                                    child: ElasticIn(
                                        delay: const Duration(seconds: 2),
                                        child: PeopleIcons(
                                            55, 'assets/avatar3.svg')),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 60,
                                left: -20,
                                child: FadeIn(
                                  controller: (controller) =>
                                      _animationController7 = controller,
                                  delay: const Duration(seconds: 1),
                                  child: Transform.rotate(
                                    angle: -0.1,
                                    child: ElasticIn(
                                        delay: const Duration(seconds: 2),
                                        child: PeopleIcons(
                                            40, 'assets/avatar.svg')),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 30,
                                left: 30,
                                child: FadeIn(
                                  controller: (controller) =>
                                      _animationController8 = controller,
                                  delay: const Duration(seconds: 1),
                                  child: Transform.rotate(
                                    angle: 0.2,
                                    child: ElasticIn(
                                        delay: const Duration(seconds: 2),
                                        child: PeopleIcons(
                                            50, 'assets/avatar3.svg')),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            FadeInUp(
              controller: (controller) => _animationController9 = controller,
              child: Text(
                "Create, Find and\n Join your circle now!",
                style: TextStyle(
                    color: bgWhite,
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.3,
                    height: 1.3,
                    fontFamily: 'Poppins'),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            FadeInUpBig(
              controller: (controller) => _animationController10 = controller,
              //  controller: (p0) => _animationController = p0,
              child: Text(
                "solution for every passionate people to find\nfriends with same passion in the world",
                style:
                    TextStyle(color: bgWhite, letterSpacing: 1.1, height: 1.3),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 70,
            ),
            FadeInUpBig(
              controller: (controller) => _animationController11 = controller,
              //controller: (p0) => _animationController = p0,
              delay: const Duration(milliseconds: 800),
              child: GestureDetector(
                onTap: () {
                  print('clicked');
                  _animationController1.reverse();
                  _animationController2.reverse();
                  _animationController3.reverse();
                  _animationController4.reverse();
                  _animationController5.reverse();
                  _animationController6.reverse();
                  _animationController7.reverse();
                  _animationController11.reverse();
                  _animationController8.reverse();
                  _animationController9.reverse();
                  _animationController10.reverse();
                  Future.delayed(const Duration(milliseconds: 900), () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    );
                  });
                },
                child: CustomBtn(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomBtn extends StatelessWidget {
  final String title;
  const CustomBtn({
    Key? key,
    this.title = "Get Started",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 260,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: title == 'Back' ? bgWhite : bgBlack,
        border:
            Border.all(color: title == 'Back' ? bgBlack : Colors.transparent),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(color: title == 'Back' ? bgBlack : bgWhite),
        ),
      ),
    );
  }
}
