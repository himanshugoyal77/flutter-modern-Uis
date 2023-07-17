import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class SportsBannerCard extends StatelessWidget {
  const SportsBannerCard({
    Key? key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.distance,
    required this.outOf,
    required this.total,
    required this.players,
  }) : super(key: key);

  final String image;
  final String title;
  final String subtitle;
  final String distance;
  final String outOf;
  final String total;
  final List players;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.4,
      width: 300,
      margin: const EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [],
        border: Border.all(color: Colors.grey[300]!, width: 0.3),
        image: DecorationImage(
            image: AssetImage(
              image,
            ),
            fit: BoxFit.cover,
            filterQuality: FilterQuality.high,
            opacity: 0.8,
            colorFilter:
                const ColorFilter.mode(Colors.black26, BlendMode.darken)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[300]!.withOpacity(0.2),
                borderRadius: BorderRadius.circular(50),
              ),
              child: CircularPercentIndicator(
                  radius: 24.0,
                  lineWidth: 4.0,
                  animation: true,
                  percent: double.parse(outOf) / double.parse(total),
                  center: Text(
                    "$outOf/$total",
                    style: const TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  backgroundColor: Colors.grey[300]!,
                  circularStrokeCap: CircularStrokeCap.round,
                  progressColor: Colors.deepPurple[400]!),
            ),
            Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 100,
                    height: 44,
                    child: Stack(
                      children: [
                        playerCard(
                          image: players[0],
                          left: 0,
                        ),
                        playerCard(
                          image: players[1],
                          left: 20,
                        ),
                        playerCard(
                          image: players[2],
                          left: 40,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 70,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xffbe3ed4).withOpacity(0.9),
                          Color(0xffbe3ed4)
                        ],
                        stops: [0, 1],
                        end: Alignment.bottomRight,
                        begin: Alignment.topLeft,
                      ),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.4),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        )
                      ],
                    ),
                    child: Center(
                      child: Text(
                        "Join",
                        style: GoogleFonts.montserrat(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                      text: title,
                      style: GoogleFonts.oswald(
                        color: Colors.grey[300],
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: "\n$subtitle",
                      style: GoogleFonts.montserrat(
                        color: Colors.grey[300],
                        fontSize: 12,
                      ),
                    ),
                  ])),
                  Text("${distance}km",
                      style: GoogleFonts.montserrat(
                        color: Colors.grey,
                        fontSize: 12,
                      )),
                ],
              )
            ]),
          ],
        ),
      ),
    );
  }
}

class playerCard extends StatelessWidget {
  final String image;
  final double left;
  const playerCard({
    Key? key,
    required this.image,
    required this.left,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: left,
        child: CircleAvatar(
          backgroundImage: NetworkImage(image),
        ));
  }
}
