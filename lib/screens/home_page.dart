import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:marvel_drubble/constants.dart';
import 'package:marvel_drubble/screens/details_screen.dart';
import 'package:marvel_drubble/widgets/superhero_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(
              CupertinoIcons.search,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "MARVEL",
                        style: GoogleFonts.ubuntu(
                          letterSpacing: -3,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Text(
                        "Super hero",
                        style: GoogleFonts.ubuntu(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                )),
            const SizedBox(
              height: 120,
            ),
            CarouselSlider(
              items: inFo
                  .map((e) => SuperHeroCard(
                        bg: e['bg'],
                        img: e['img'],
                        name: e['name'],
                        realName: e['realName'],
                        desc: e['desc'],
                        color: e['color'],
                      ))
                  .toList(),
              options: CarouselOptions(
                clipBehavior: Clip.none,
                height: 400,
                viewportFraction: 0.8,
                enlargeCenterPage: true,
              ),
            )
          ],
        ),
      ),
    );
  }
}
