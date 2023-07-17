import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:sports_app/screens/home_page.dart';
import 'package:sports_app/screens/map_page.dart';

import '../components/home/sports_card.dart';
import '../constants.dart';
import '../models/event_model.dart';

class GamesList extends StatefulWidget {
  const GamesList({super.key});

  @override
  State<GamesList> createState() => _GamesListState();
}

class _GamesListState extends State<GamesList> {
  int currentTab = 1;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Material(
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              Color(0xff020024).withOpacity(0.1),
              Color(0xff020024).withOpacity(0.2),
              Color(0xff020024).withOpacity(0.4),
              Color(0xff020024).withOpacity(0.6),
              Color(0xff020024).withOpacity(0.8),
              Color(0xff020024).withOpacity(0.9),
              Color(0xff020024),
            ],
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 20,
              left: 0,
              right: 0,
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 40.0, left: 20.0, right: 20.0),
                child: CustomAppbar(size: size, title: 'ALL EVENTS'),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                margin: const EdgeInsets.only(top: 10.0),
                width: size.width,
                height: size.height * 0.9 - 20,
                color: Colors.grey[300],
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: sportsEvents
                        .map((e) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: SingleEventCard(
                                event: e,
                              ),
                            ))
                        .toList(),
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
            ),
          ],
        ),
      ),
    );
  }
}

class SingleEventCard extends StatelessWidget {
  const SingleEventCard({
    super.key,
    required this.event,
  });
  final EventModel event;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      // color: Colors.grey[300],
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 5.0),
        child: Row(
          children: [
            Container(
              alignment: Alignment.topLeft,
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: AssetImage(event.image),
                    filterQuality: FilterQuality.high,
                    opacity: 0.8,
                    alignment: Alignment.topLeft,
                    scale: 2,
                    colorFilter: const ColorFilter.mode(
                        Colors.black26, BlendMode.darken),
                    fit: BoxFit.cover),
              ),
              child: Container(
                //   padding: const EdgeInsets.all(2.0),
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(50)),
                margin: const EdgeInsets.only(top: 5.0, left: 5),
                child: CircularPercentIndicator(
                    radius: 20.0,
                    lineWidth: 4.0,
                    animation: true,
                    percent: event.inPlayers / event.totalPlayers,
                    center: Text(
                      "${event.inPlayers.toStringAsFixed(0)}/${event.totalPlayers.toStringAsFixed(0)}",
                      style: const TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                    backgroundColor: Colors.transparent,
                    circularStrokeCap: CircularStrokeCap.round,
                    progressColor: Colors.deepPurple[400]!),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width - 190,
              height: 110,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                          text: event.title,
                          style: GoogleFonts.oswald(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: "\n${event.subTitle}",
                          style: GoogleFonts.montserrat(
                            color: Colors.black,
                            fontSize: 12,
                          ),
                        ),
                      ])),
                      Text("${event.distance}",
                          style: GoogleFonts.montserrat(
                            color: Colors.black,
                            fontSize: 12,
                          )),
                    ],
                  ),
                  // const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        width: 100,
                        height: 44,
                        child: Expanded(
                          child: Stack(
                            children: event.players
                                .map((e) => playerCard(
                                      image: e,
                                      left: event.players.indexOf(e) * 20.0,
                                    ))
                                .toList(),
                          ),
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (ctx) => MapPage()));
                          },
                          child: const OutlinedButton())
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class OutlinedButton extends StatelessWidget {
  const OutlinedButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffbe3ed4)),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(
          "Join",
          style: GoogleFonts.montserrat(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Color(0xffbe3ed4)),
        ),
      ),
    );
  }
}
