import 'dart:ui';

import 'package:burger_app/animations/translate_animation.dart';
import 'package:burger_app/animations/translateup_animation.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController _pageController = PageController();
  List<String> selected = [];

  final List<List<String>> _children = [
    ["assets/bread/p.png", "assets/bread/p4.png", "assets/bread/p5down.png"],
    ["assets/leaf/leaf.png", "assets/leaf/leaf.png", "assets/leaf/leaf.png"],
    ["assets/meat/m1.png", "assets/meat/m2.png", "assets/meat/m3.png"],
    ["assets/sauce/s.png", "assets/sauce/s.png", "assets/sauce/s.png"],
    ["assets/cheese/ch.png", "assets/cheese/ch2.png", "assets/cheese/ch3.png"],
    ["assets/tomato/t1.png", "assets/tomato/t2.png", "assets/tomato/t3.png"],
    // ["assets/bread/p.png", "assets/bread/p4up.png", "assets/bread/p5.png"],
  ];

  @override
  void initState() {
    super.initState();
  }

  // 0 + 20
  // 1* 4 + 20
  // 2
  // 3
  //

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xfff7746a),
      body: Column(
        children: [
          Container(
              height: size.height * 0.7,
              width: double.infinity,
              color: Colors.deepPurple,
              child: Column(
                children: [
                  Spacer(
                    flex: 1,
                  ),
                  AnimatedScale(
                      duration: const Duration(milliseconds: 800),
                      curve: Curves.bounceIn,
                      scale: selected.length == 5 ? 1 : 0.8,
                      child: MakeYourBurger(selected: selected)),
                ],
              )),
          const SizedBox(
            height: 4,
          ),
          Container(
            //  color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        _pageController.previousPage(
                            duration: const Duration(milliseconds: 800),
                            curve: Curves.easeIn);
                      },
                      icon: const Icon(Icons.arrow_back_ios_rounded)),
                  IconButton(
                      onPressed: () {
                        _pageController.nextPage(
                            duration: const Duration(milliseconds: 800),
                            curve: Curves.easeIn);
                      },
                      icon: const Icon(Icons.arrow_forward_ios_rounded)),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            color: Color(0xfff7746a),
            width: double.infinity,
            height: size.height * 0.2,
            child: PageView.builder(
                controller: _pageController,
                itemCount: _children.length,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (value) {
                  print(value);
                },
                itemBuilder: (context, index) {
                  return Center(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                        width: size.width * 0.9,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: List.generate(_children[index].length,
                                (index2) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selected.add(_children[index][index2]);
                                  });
                                },
                                child: Container(
                                  // margin: const EdgeInsets.only(left: 10),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      gradient: const RadialGradient(
                                        colors: [
                                          Color(0xfff7746a),
                                          Color(0xffe8e8e8)
                                        ],
                                        stops: [0, 1],
                                        center: Alignment.center,
                                      ),
                                      boxShadow: const [
                                        BoxShadow(
                                          offset: Offset(3, 3),
                                          spreadRadius: -3,
                                          blurRadius: 5,
                                          color: Color.fromRGBO(0, 0, 0, 1),
                                        )
                                      ]),
                                  child: Image.asset(
                                    _children[index][index2],
                                    height: 150,
                                    width: 110,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              );
                            })),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}

class MakeYourBurger extends StatelessWidget {
  const MakeYourBurger({
    super.key,
    required this.selected,
  });

  final List<String> selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 430,
      width: 200,
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        //   color: Colors.red,
        borderRadius: BorderRadius.circular(20),
        //    color: Colors.transparent,
      ),
      child: Stack(alignment: Alignment.center, children: [
        Positioned(
          bottom: -40,
          left: 0,
          child: Image.network(
            "https://static.vecteezy.com/system/resources/previews/013/169/085/original/oval-shadow-for-object-or-product-png.png",
            height: 200,
            width: 200,
          ),
        ),
        selected.length == 5
            ? Positioned(
                height: 200,
                top: -20,
                child: Container(
                  child: Image.asset("assets/bread/p4up.png",
                      height: 200, width: 200, fit: BoxFit.contain),
                ),
              )
            : Container(),
        for (int i = 0; i < selected.length; i++)
          AnimatedPositioned(
            duration: const Duration(milliseconds: 800),
            width: 200,
            height: 200,
            bottom: 50 * i.toDouble(),
            child: TranslateRightAnimation(
              child: Image.asset(selected[i],
                  height: 200, width: 200, fit: BoxFit.contain),
            ),
          )
      ]),
    );
  }
}
