import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:friends/constants.dart';
import 'package:friends/controllers/location_controller.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:friends/screens/profile_screen.dart';
import 'package:friends/screens/splash_screen.dart';
import 'package:friends/widgets/create_circle.dart';
import 'package:friends/widgets/people_icons.dart';
import 'package:friends/widgets/searchbar.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final LocationController _locationController = LocationController();
  late LatLng currentLocation;
  bool isVisible = false;

  @override
  void initState() {
    _locationController.updateCurrentPosition();
    currentLocation = _locationController.getPosition();
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Obx((() => Container(
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
                        point: LatLng(_locationController.lat.value + 0.1,
                            _locationController.lon.value + 0.1),
                        builder: ((context) => GestureDetector(
                            onLongPress: () {
                              print('long pressed');
                            },
                            child: ElasticIn(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(bottom: 10),
                                  height: 40,
                                  width: 140,
                                  decoration: BoxDecoration(
                                    color: bgWhite,
                                    border:
                                        Border.all(color: bgBlack, width: 0),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: ElasticIn(
                                      child: Center(
                                          child: Text('🎵 Music composer'))),
                                ),
                                PeopleIcons(45, 'assets/avatar1.svg'),
                              ],
                            )))),
                      ),
                      Marker(
                        width: 140,
                        height: 120,
                        point: LatLng(_locationController.lat.value,
                            _locationController.lon.value),
                        builder: ((context) => GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (ctx) => ProfileScreen()));
                            },
                            child: Column(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(
                                      bottom: 10, top: 20),
                                  height: 40,
                                  width: 110,
                                  decoration: BoxDecoration(
                                    color: bgWhite,
                                    border:
                                        Border.all(color: bgBlack, width: 0),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(
                                    child: Text('🎮 Gammer'),
                                  ),
                                ),
                                ElasticIn(
                                    child:
                                        PeopleIcons(45, 'assets/avatar3.svg')),
                              ],
                            ))),
                      ),
                      Marker(
                        width: 140,
                        height: 120,
                        point: LatLng(_locationController.lat.value + 0.2,
                            _locationController.lon.value - 0.2),
                        builder: ((context) => GestureDetector(
                            onTap: () {
                              print('tapped');
                            },
                            child: Column(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(bottom: 10),
                                  height: 40,
                                  width: 110,
                                  decoration: BoxDecoration(
                                    color: bgWhite,
                                    border:
                                        Border.all(color: bgBlack, width: 0),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(child: Text('📈 Investor')),
                                ),
                                ElasticIn(
                                    child:
                                        PeopleIcons(45, 'assets/avatar2.svg')),
                              ],
                            ))),
                      ),
                      Marker(
                        width: 140,
                        height: 120,
                        point: LatLng(_locationController.lat.value - 0.2,
                            _locationController.lon.value + 0.2),
                        builder: ((context) => GestureDetector(
                            onTap: () {
                              print('tapped');
                            },
                            child: Column(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(bottom: 10),
                                  height: 40,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    color: bgWhite,
                                    border:
                                        Border.all(color: bgBlack, width: 0),
                                        
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(child: Text('👩‍🎨 Artist')),
                                ),
                                ElasticIn(
                                    child:
                                        PeopleIcons(45, 'assets/avatar.svg')),
                              ],
                            ))),
                      ),
                    ],
                  )
                ],
              )))),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                  color: bgBlack, borderRadius: BorderRadius.circular(20)),
              child: GNav(
                  rippleColor:
                      Colors.grey[800]!, // tab button ripple color when pressed
                  hoverColor: Colors.grey[700]!, // tab button hover color
                  haptic: true, // haptic feedback
                  tabBorderRadius: 15,
                  tabActiveBorder:
                      Border.all(color: bgWhite, width: 1), // tab button border
                  tabBorder: Border.all(
                      color: Colors.grey, width: 1), // tab button border
                  // tab button shadow
                  curve: Curves.easeOutExpo, // tab animation curves
                  duration:
                      Duration(milliseconds: 900), // tab animation duration
                  gap: 8, // the tab button gap between icon and text
                  color: Colors.grey, // unselected icon color
                  activeColor: bgWhite, // selected icon and text color
                  iconSize: 24, // tab button icon size
                  tabBackgroundColor:
                      bgBlack.withOpacity(0.1), // selected tab background color
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10, vertical: 5), // navigation bar padding
                  tabs: [
                    const GButton(
                      icon: Icons.home,
                      text: 'Home',
                    ),
                    const GButton(
                      icon: Icons.search,
                      text: 'Search',
                    ),
                    const GButton(
                      icon: CupertinoIcons.mail,
                      text: 'chat',
                    ),
                    GButton(
                      icon: CupertinoIcons.add,
                      text: 'add',
                      onPressed: () {
                        setState(() {
                          isVisible = true;
                        });
                      },
                    ),
                  ]),
            ),
          ),
          Positioned(
              right: 20,
              top: 40,
              child: Visibility(
                visible: !isVisible,
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      color: bgBlack, borderRadius: BorderRadius.circular(20)),
                  child: GestureDetector(
                      onTap: () {
                        _locationController.updateCurrentPosition();
                        setState(() {});
                      },
                      child: Icon(CupertinoIcons.refresh, color: bgWhite)),
                ),
              )),
          Positioned(
              top: 40,
              child: Visibility(
                  visible: !isVisible,
                  child: SizedBox(width: 320, child: SearchBar()))),
          Positioned(
              top: 80,
              left: 20,
              right: 20,
              child: CreateEvent(
                isVisible: isVisible,
              )),
        ],
      ),
    );
  }
}

Widget _buildPopupDialog(BuildContext context) {
  return AlertDialog(
    title: const Text('Popup example'),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Hello"),
      ],
    ),
    actions: <Widget>[
      TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Text('Close'),
      ),
    ],
  );
}
