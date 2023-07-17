import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import 'games_list.dart';
import 'home_page.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late LatLng currentLocation;
  bool isVisible = false;

  double currentLat = 19.24;
  double currentLong = 73.12;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Random random = Random();
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
                  child: CurrentEventLocation(
                      size: size,
                      currentLat: currentLat,
                      currentLong: currentLong),
                )),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    children: sportsEvents
                        .map((e) => Container(
                              margin: const EdgeInsets.only(
                                  left: 10.0, right: 10.0, bottom: 10),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)),
                              child: SingleEventCard(
                                event: e,
                              ),
                            ))
                        .toList()),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CurrentEventLocation extends StatelessWidget {
  const CurrentEventLocation({
    super.key,
    required this.size,
    required this.currentLat,
    required this.currentLong,
  });

  final Size size;
  final double currentLat;
  final double currentLong;

  @override
  Widget build(BuildContext context) {
    Random random = Random();
    return Container(
        height: size.height,
        child: FlutterMap(
          options: MapOptions(
            zoom: 10.0,
            center: LatLng(19.24, 73.12),
          ),
          children: [
            TileLayer(
              urlTemplate:
                  'https://api.mapbox.com/styles/v1/mapbox/streets-v11/tiles/{z}/{x}/{y}?access_token=pk.eyJ1IjoiaXNvc2NlbGVzIiwiYSI6ImNsZjI4YjhpeTBmeTI0NGxjdWt2emNnazgifQ.oObR7aEeGzuuP1yuwvGoUA',
              subdomains: ['a', 'b', 'c'],
            ),
            MarkerLayer(
              markers: [
                Marker(
                  width: 140,
                  height: 120,
                  point: LatLng(currentLat + 0.1, currentLong + 0.1),
                  builder: ((context) => GestureDetector(
                      onLongPress: () {
                        print('long pressed');
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Center(
                                child: Text(
                              '25',
                              style: GoogleFonts.oswald(color: Colors.white),
                            )),
                          ),
                          Text(
                            'Box Cricket',
                            style: GoogleFonts.oswald(color: Colors.black),
                          )
                        ],
                      ))),
                ),
                Marker(
                  width: 140,
                  height: 120,
                  point: LatLng(currentLat - 0.03, currentLong),
                  builder: ((context) => GestureDetector(
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (ctx) => ProfileScreen()));
                      },
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Center(
                                child: Text(
                              '20',
                              style: GoogleFonts.oswald(color: Colors.white),
                            )),
                          ),
                          Text(
                            'Box Cricket',
                            style: GoogleFonts.oswald(color: Colors.black),
                          )
                        ],
                      ))),
                ),
                Marker(
                  width: 140,
                  height: 120,
                  point: LatLng(currentLat + 0.2, currentLong - 0.2),
                  builder: ((context) => GestureDetector(
                      onTap: () {
                        print('tapped');
                      },
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              border: Border.all(color: Colors.black, width: 0),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Center(
                                child: Text(
                              '25',
                              style: GoogleFonts.oswald(color: Colors.white),
                            )),
                          ),
                          Text(
                            'Box Cricket',
                            style: GoogleFonts.oswald(color: Colors.black),
                          )
                        ],
                      ))),
                ),
                Marker(
                  width: 140,
                  height: 120,
                  point: LatLng(currentLat - 0.2, currentLong + 0.2),
                  builder: ((context) => GestureDetector(
                      onTap: () {
                        print('tapped');
                      },
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.teal,
                              border: Border.all(color: Colors.black, width: 0),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Center(
                                child: Text(
                              '45',
                              style: GoogleFonts.oswald(color: Colors.white),
                            )),
                          ),
                          Text(
                            'Tennis Doubles',
                            style: GoogleFonts.oswald(color: Colors.black),
                          )
                        ],
                      ))),
                ),
                ...List.generate(50, (index) {
                  double generateRandomDouble() =>
                      random.nextDouble() * (1 - (-1)) + (-1);

                  return Marker(
                      point: LatLng(currentLat + generateRandomDouble(),
                          currentLong + generateRandomDouble()),
                      builder: (ctx) => Icon(Icons.location_on));
                }),
              ],
            )
          ],
        ));
  }
}
