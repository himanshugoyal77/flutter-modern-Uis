import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sports_app/components/home/sports_card.dart';

class TempScreen extends StatelessWidget {
  TempScreen({super.key});

  final PageController controller =
      PageController(initialPage: 0, viewportFraction: 0.8);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          height: size.height * 0.5,
          width: size.width,
          child: PageView(
            controller: controller,
            children: [
              SizedBox(
                width: size.width * 0.2,
                child: SportsBannerCard(
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
              SportsBannerCard(
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
            ],
          ),
        ),
      ],
    );
  }
}
