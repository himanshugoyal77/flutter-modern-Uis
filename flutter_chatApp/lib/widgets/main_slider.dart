import 'package:chat_app/component/slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainSlider extends StatelessWidget {
  const MainSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
      child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.only(top: 22, bottom: 20),
            child: Row(
              children: [
                Stack(
                  children: [
                    const SizedBox(
                      //margin: const EdgeInsets.only(left: 18),
                      width: 90,
                      height: 140,
                    ),
                    Container(
                        // margin: const EdgeInsets.only(left: 18),
                        height: 110,
                        width: 90,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: const DecorationImage(
                                image: NetworkImage(
                                    "https://images.unsplash.com/photo-1559386484-97dfc0e15539?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8Ym95c3xlbnwwfHwwfHw%3D&w=1000&q=80"),
                                fit: BoxFit.cover)),
                        child: Center(
                          child: Container(
                            height: 110,
                            width: 90,
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.7),
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  CupertinoIcons.heart_fill,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  "20",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                        )),
                    Positioned(
                        bottom: 20,
                        left: 10,
                        right: 10,
                        child: Container(
                            // margin: const EdgeInsets.only(left: 18),
                            height: 20,
                            width: 60,
                            decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0xffDDDDDD),
                                  blurRadius: 2.0,
                                  spreadRadius: 0.6,
                                  offset: Offset(0.44, 0.0),
                                )
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Center(
                              child: Text("Likes"),
                            ))),
                  ],
                ),
                CustomSlider()
              ],
            ),
          )),
    );
  }
}
