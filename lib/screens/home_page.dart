import 'dart:math';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sports_app/components/home/sports_card.dart';

import 'package:sports_app/constants.dart';
import 'package:sports_app/main.dart';
import 'package:sports_app/screens/games_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
  }

  int selectedIndex = 0;
  int currentIndex = 0;
  int currentTab = 1;

  List sportsCatergory = [
    "All",
    Icons.sports_cricket_outlined,
    Icons.sports_football_outlined,
    Icons.sports_tennis_outlined,
    Icons.sports_volleyball_outlined,
    Icons.sports_rugby_outlined,
    Icons.sports_basketball_outlined,
    Icons.sports_baseball_outlined,
    Icons.sports_esports_outlined,
    Icons.sports_handball_outlined,
    Icons.sports_mma_outlined,
    Icons.sports_motorsports_outlined,
  ];
  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(
      initialPage: 0,
      viewportFraction: 0.64,
    );
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          const WidgetWrapper(),
          const PinkGradient(),
          Positioned(
            top: 20,
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 40.0, left: 20.0, right: 20.0),
              child: CustomAppbar(size: size),
            ),
          ),
          Positioned(
            top: size.height * 0.11,
            left: 20,
            height: size.height * 0.3,
            child: Text(
              "POPULAR",
              style: GoogleFonts.oswald(
                fontSize: 38,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
              left: 20,
              top: size.height * 0.2,
              child: Container(
                height: 80,
                width: size.width,
                padding: const EdgeInsets.symmetric(vertical: 10),
                // decoration: BoxDecoration(
                //     border: Border.all(color: Colors.grey[300]!, width: 0.3)),
                child: ListView(
                  clipBehavior: Clip.none,
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                    sportsCatergory.length,
                    (index) => GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: AnimatedOpacity(
                        curve: Curves.bounceIn,
                        duration: const Duration(milliseconds: 300),
                        opacity: selectedIndex == index ? 1 : 0.5,
                        child: CircularCards(
                          index: index,
                          sportsCatergory: sportsCatergory,
                          selectedIndex: selectedIndex,
                        ),
                      ),
                    ),
                  ),
                ),
              )),
          Positioned(
            top: size.height * 0.33,
            left: 20,
            child: Container(
              height: size.height * 0.4,
              width: size.width,
              alignment: Alignment.topLeft,
              child: PageView(
                physics: const BouncingScrollPhysics(),
                clipBehavior: Clip.none,
                padEnds: false,
                controller: controller,
                scrollDirection: Axis.horizontal,
                onPageChanged: (value) {
                  setState(() {
                    currentIndex = value;
                  });
                },
                children: const [
                  SportsBannerCard(
                    distance: "3",
                    image: "assets/pool/pool1.jpg",
                    outOf: "3",
                    title: "Basketball",
                    subtitle: "Mon 20th 6:00 p.m.",
                    total: "5",
                    players: [
                      "https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                      "https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                      "https://images.pexels.com/photos/91227/pexels-photo-91227.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
                    ],
                  ),
                  SportsBannerCard(
                    distance: "2.3",
                    image: "assets/basketball/bb1.jpg",
                    outOf: "4",
                    title: "Basketball",
                    subtitle: "Mon 20th 6:00 p.m.",
                    total: "8",
                    players: [
                      "https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                      "https://images.pexels.com/photos/91227/pexels-photo-91227.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                      "https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: SportsBannerCard(
                      distance: "1.5",
                      image: "assets/rubby/rb1.jpg",
                      outOf: "7",
                      title: "Football",
                      subtitle: "Mon 20th 6:00 p.m.",
                      total: "11",
                      players: [
                        "https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                        "https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                        "https://images.pexels.com/photos/775358/pexels-photo-775358.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 40,
            right: 40,
            top: size.height * 0.75,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  3,
                  (index) => Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        child: Icon(Icons.circle,
                            key: UniqueKey(),
                            color: currentIndex == index
                                ? Colors.blue
                                : Colors.grey[300]!,
                            size: 8),
                        transitionBuilder: (child, animation) {
                          return FadeTransition(
                            opacity: animation,
                            child: child,
                          );
                        },
                      ))),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: GestureDetector(
              onVerticalDragUpdate: (details) {
                if (details.primaryDelta! < -1.5) {
                  Navigator.push(
                    context,
                    PageRouteBuilder(pageBuilder: (context, animation, _) {
                      return FadeTransition(
                        opacity: animation,
                        child: const GamesList(),
                      );
                    }),
                  );
                }
              },
              child: Container(
                height: size.height - size.height * 0.79,
                width: size.width,
                decoration: BoxDecoration(
                  color: Colors.grey[200]!,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                ),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 12, bottom: 6),
                      height: 8,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Colors.grey[300]!,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: SingleEventCard(event: sportsEvents[0]),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: CurvedNavigationBar(
                backgroundColor: Colors.transparent,
                color: Colors.white,
                height: kToolbarHeight,
                buttonBackgroundColor: Colors.purple,
                animationCurve: Curves.easeInOut,
                animationDuration: const Duration(milliseconds: 300),
                index: currentTab,
                onTap: (index) {
                  setState(() {
                    currentTab = index;
                  });
                },
                items: [
                  Icon(
                    CupertinoIcons.search,
                    size: 22,
                    color: currentTab == 0 ? Colors.white : primaryTextColor,
                  ),
                  Icon(
                    Icons.add,
                    size: 22,
                    color: currentTab == 1 ? Colors.white : primaryTextColor,
                  ),
                  Icon(
                    Icons.calendar_today,
                    size: 22,
                    color: currentTab == 2 ? Colors.white : primaryTextColor,
                  ),
                  Icon(
                    Icons.person_2_outlined,
                    size: 22,
                    color: currentTab == 3 ? Colors.white : primaryTextColor,
                  ),
                ]),
          )
        ],
      ),
    );
  }
}

class CircularCards extends StatefulWidget {
  const CircularCards({
    super.key,
    required this.index,
    required this.sportsCatergory,
    required this.selectedIndex,
  });

  final int index;
  final List sportsCatergory;
  final int selectedIndex;

  @override
  State<CircularCards> createState() => _CircularCardsState();
}

class _CircularCardsState extends State<CircularCards> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      clipBehavior: Clip.hardEdge,
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
          // border: widget.selectedIndex == widget.index
          //     ? Border.all(color: Colors.white, width: 1.2)
          //     : Border.all(color: Colors.grey[300]!, width: 0.3),
          color: widget.selectedIndex == widget.index
              ? Colors.blue.withOpacity(0.7)
              : Colors.grey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(50),
          boxShadow: widget.selectedIndex == widget.index
              ? [
                  BoxShadow(
                    color: Colors.blue.withAlpha(125),
                    blurRadius: 12,
                    spreadRadius: 0.1,
                    offset: Offset(1, 0),
                  )
                ]
              : []),
      child: widget.index == 0
          ? Center(
              child: Text(
                "ALL",
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                  fontSize: 16,
                  letterSpacing: 0.2,
                  fontWeight: FontWeight.bold,
                  color: widget.selectedIndex == widget.index
                      ? Colors.white
                      : Colors.grey.withOpacity(0.5),
                ),
              ),
            )
          : Icon(
              widget.sportsCatergory[widget.index],
              size: 30,
              color: widget.selectedIndex == widget.index
                  ? Colors.white
                  : Colors.grey.withOpacity(0.5),
            ),
    );
  }
}

class PinkGradient extends StatelessWidget {
  const PinkGradient({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      right: 0,
      child: Opacity(
        opacity: 1,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.topLeft,
              colors: [
                const Color(0xff561E4D).withOpacity(1),
                const Color(0xff561E4D).withOpacity(0.8),
                const Color(0xff561E4D).withOpacity(0.6),
                const Color(0xff561E4D).withOpacity(0.4),
                const Color(0xff561E4D).withOpacity(0.2),
                const Color(0xff561E4D).withOpacity(0.1),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({
    super.key,
    required this.size,
    this.title,
  });

  final Size size;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width - 40,
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "London",
            style: TextStyle(
              letterSpacing: 0.2,
              color: primaryTextColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(width: 5),
          Icon(
            Icons.keyboard_arrow_down,
            size: 18,
            color: primaryTextColor,
          ),
          const Spacer(),
          title != null
              ? Text(
                  title.toString(),
                  style: GoogleFonts.oswald(
                    letterSpacing: 0.2,
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                )
              : Container(),
          const Spacer(),
          Icon(
            CupertinoIcons.placemark,
            size: 20,
            color: primaryTextColor,
          ),
          const SizedBox(width: 10),
          Icon(
            Icons.filter_list,
            size: 22,
            color: primaryTextColor,
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}
