import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marvel_drubble/constants.dart';
import 'package:marvel_drubble/controller/controller.dart';
import 'package:shaky_animated_listview/animators/grid_animator.dart';


class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double fractionOfSpider = size.height / 300;
    bool isAnimate = false;
    double _percent = 0.0;

    final getxController = Get.put(GetxScroll());

    return Scaffold(
      backgroundColor: pRed,
      body: Stack(
        children: [
          Positioned(
            top: 40,
            left: 0,
            right: 0,
            height: 300,
            child: Hero(
              tag: 'spider',
              child: Image.asset(
                'assets/spider.png',
                color: Colors.white,
                fit: BoxFit.contain,
                height: 300,
                width: 300,
              ),
            ),
          ),
          Positioned(
            top: 65,
            left: 0,
            right: 0,
            height: 240,
            child: Hero(
              tag: 'spiderman',
              child: Image.asset(
                'assets/spiderman.png',
                fit: BoxFit.contain,
                height: 240,
                width: 240,
              ),
            ),
          ),
          Positioned(
              top: 330,
              left: 20,
              right: 20,
              child: SlideInUp(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Spider-Man",
                        style: GoogleFonts.ubuntu(
                          color: Colors.white,
                          fontSize: 40,
                          letterSpacing: -2,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Peter Parker",
                        style: GoogleFonts.ubuntu(
                            color: Colors.grey[300], fontSize: 20),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Spider-Man is a superhero appearing \nin American comic books published by \nMarvel Comics. Created by writer-editor \nStan Lee and artist Steve Ditko",
                        style:
                            TextStyle(color: Colors.grey[300], wordSpacing: 2),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
              )),
          SlideInUp(
              from: 200,
              delay: const Duration(milliseconds: 300),
              child: SlideInUp(
                from: -100,
                child: NotificationListener<DraggableScrollableNotification>(
                  onNotification: ((notification) {
                    print("noti " + (2 * notification.extent - 0.8).toString());
                    getxController.setScroll(2 * notification.extent - 0.8);
                    return true;
                  }),
                  child: DraggableScrollableSheet(
                      maxChildSize: 0.58,
                      initialChildSize: 0.34,
                      minChildSize: 0.34,
                      builder: ((context, ScrollController scrollController) {
                        return Container(
                          width: size.width,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20))),
                          child: SingleChildScrollView(
                            controller: scrollController,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 30, top: 30),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(0.0),
                                    child: Text(
                                      "LASTEST NEWS",
                                      style: GoogleFonts.ubuntu(
                                          letterSpacing: -1.2,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                      height: 90,
                                      child: Obx(
                                        () => AnimatedList(
                                            scrollDirection: Axis.horizontal,
                                            initialItemCount:
                                                getxController.scroll.value > 0
                                                    ? hr.length
                                                    : 3,
                                            itemBuilder:
                                                ((context, index, animation) {
                                              print(animation.value);
                                              if ((getxController
                                                      .scroll.value) >
                                                  0) {
                                                return GridAnimatorWidget(
                                                  child: Container(
                                                    height: 90,
                                                    width: 140,
                                                    margin:
                                                        const EdgeInsets.only(
                                                            right: 14.0),
                                                    decoration: BoxDecoration(
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Colors
                                                                .grey[300]!,
                                                            blurRadius: 5,
                                                            offset:
                                                                const Offset(
                                                                    0, 3),
                                                          )
                                                        ],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                        image: DecorationImage(
                                                            image: AssetImage(
                                                                hr[index]),
                                                            fit: BoxFit.cover)),
                                                  ),
                                                );
                                              } else {
                                                return Container(
                                                  height: 90,
                                                  width: 140,
                                                  margin: const EdgeInsets.only(
                                                      right: 14.0),
                                                  decoration: BoxDecoration(
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color:
                                                              Colors.grey[300]!,
                                                          blurRadius: 5,
                                                          offset: const Offset(
                                                              0, 3),
                                                        )
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      image: DecorationImage(
                                                          image: AssetImage(
                                                              hr[index]),
                                                          fit: BoxFit.cover)),
                                                );
                                              }
                                            })),
                                      )),
                                  const SizedBox(
                                    height: 28,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(0.0),
                                    child: Text(
                                      "RELATED MOVIES",
                                      style: GoogleFonts.ubuntu(
                                          letterSpacing: -1.2,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                      height: 200,
                                      child: Obx(
                                        () => AnimatedList(
                                            scrollDirection: Axis.horizontal,
                                            initialItemCount:
                                                getxController.scroll.value > 0
                                                    ? hr.length
                                                    : 3,
                                            itemBuilder:
                                                ((context, index, animation) {
                                              print(animation.value);
                                              if ((getxController
                                                      .scroll.value) >
                                                  0) {
                                                return GridAnimatorWidget(
                                                  child: Container(
                                                    width: 140,
                                                    height: 200,
                                                    margin:
                                                        const EdgeInsets.only(
                                                            right: 14.0),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                        image: DecorationImage(
                                                            image: AssetImage(
                                                                related[index]),
                                                            fit: BoxFit.cover)),
                                                  ),
                                                );
                                              } else {
                                                return Container(
                                                  width: 140,
                                                  height: 200,
                                                  margin: const EdgeInsets.only(
                                                      right: 14.0),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      image: DecorationImage(
                                                          image: AssetImage(
                                                              related[index]),
                                                          fit: BoxFit.cover)),
                                                );
                                              }
                                            })),
                                      )),
                                ],
                              ),
                            ),
                          ),
                        );
                      })),
                ),
              )),
          Positioned(
            top: 30,
            left: 18.0,
            child: IconButton(
                onPressed: () => Get.back(),
                icon: Icon(
                  Icons.keyboard_arrow_down,
                  size: 30.0,
                  color: Colors.grey[300],
                )),
          )
        ],
      ),
    );
  }
}
