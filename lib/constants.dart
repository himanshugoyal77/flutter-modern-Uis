import 'package:flutter/material.dart';

import 'models/event_model.dart';

Color bgGradientLeft1 = const Color(0xFF21204A);
Color bgGradientLeft2 = const Color(0xFF202E4C);
Color bgGradientRight1 = const Color(0xFF46244B);
Color bgGradientRight2 = const Color(0xFF4B2349);

Color primaryTextColor = const Color(0xFF561E4D);

List<EventModel> sportsEvents = [
  EventModel(
      id: 0,
      title: "Tennis doubles",
      subTitle: "Sat 18th 2:00 p.m.",
      distance: "2.5km",
      image: "assets/rubby/rb1.jpg",
      inPlayers: 1,
      totalPlayers: 4,
      players: [
        "https://images.pexels.com/photos/5741050/pexels-photo-5741050.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
      ]),
  EventModel(
      id: 1,
      title: "Beach Volleyball",
      subTitle: "Sat 18th 2:00 p.m.",
      distance: "1km",
      image: "assets/rubby/rb2.jpg",
      inPlayers: 2,
      totalPlayers: 4,
      players: [
        "https://images.pexels.com/photos/775358/pexels-photo-775358.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
      ]),
  EventModel(
      id: 2,
      title: "Night Bowling",
      subTitle: "Sat 18th 2:00 p.m.",
      distance: "1.8km",
      image: "assets/bowling/bowl1.jpg",
      inPlayers: 4,
      totalPlayers: 8,
      players: [
        "https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        "https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        "https://images.pexels.com/photos/775358/pexels-photo-775358.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
            "https://images.pexels.com/photos/5741050/pexels-photo-5741050.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
      ]),
  EventModel(
      id: 3,
      title: "Half court basketball",
      subTitle: "Sat 18th 2:00 p.m.",
      distance: "3.5km",
      image: "assets/basketball/bb1.jpg",
      inPlayers: 2,
      totalPlayers: 4,
      players: [
        "https://images.pexels.com/photos/91227/pexels-photo-91227.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        "https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      ]),
  EventModel(
      id: 4,
      title: "Box Cricket",
      subTitle: "Sat 18th 2:00 p.m.",
      distance: "2.5km",
      image: "assets/cricket/cricket1.jpg",
      inPlayers: 3,
      totalPlayers: 5,
      players: [
        "https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        "https://images.pexels.com/photos/91227/pexels-photo-91227.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        "https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      ]),
  EventModel(
      id: 5,
      title: "Football 5v5",
      subTitle: "Sat 18th 2:00 p.m.",
      distance: "7km",
      image: "assets/football/fb1.jpg",
      inPlayers: 3,
      totalPlayers: 4,
      players: [
        "https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        "https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        "https://images.pexels.com/photos/91227/pexels-photo-91227.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      ]),
  EventModel(
      id: 6,
      title: "Rubby doubles",
      subTitle: "Sat 18th 2:00 p.m.",
      distance: "2km",
      image: "assets/rubby/rb1.jpg",
      inPlayers: 1,
      totalPlayers: 4,
      players: [
        "https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        "https://images.pexels.com/photos/91227/pexels-photo-91227.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      ]),
  EventModel(
      id: 7,
      title: "Billard",
      subTitle: "Sat 18th 2:00 p.m.",
      distance: "25.5km",
      image: "assets/pool/pool2.jpg",
      inPlayers: 1,
      totalPlayers: 4,
      players: [
        "https://images.pexels.com/photos/91227/pexels-photo-91227.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      ])
];
