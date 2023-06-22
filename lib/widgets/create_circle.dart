import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

import 'package:friends/constants.dart';
import 'package:friends/controllers/location_controller.dart';
import 'package:friends/screens/splash_screen.dart';
import 'package:friends/widgets/people_icons.dart';
import 'package:lottie/lottie.dart' as lottie;

final images = [
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ7Jf7L1uLyKL81OhzN2fk-x0OSKXABNLEZYg&usqp=CAU',
  'https://thumbs.dreamstime.com/b/businessman-icon-vector-male-avatar-profile-image-profile-businessman-icon-vector-male-avatar-profile-image-182095609.jpg',
  'https://img.freepik.com/premium-vector/brunette-man-avatar-portrait-young-guy-vector-illustration-face_217290-1035.jpg?w=2000',
  'https://static.vecteezy.com/system/resources/thumbnails/002/002/263/small_2x/black-man-with-beard-avatar-character-free-vector.jpg',
  'https://img.freepik.com/premium-vector/avatar-portrait-young-caucasian-boy-man-round-frame-vector-cartoon-flat-illustration_551425-19.jpg'
];

final List names = [
  "Emma Wilson",
  "Liam Smith",
  "Olivia Johnson",
  "Noah Brown",
  "Ava Davis",
  "William Taylor",
  "Sophia Garcia",
  "James Anderson",
  "Isabella Martinez",
  "Benjamin Hernandez",
  "Mia Wilson",
  "Michael Robinson",
  "Charlotte Lee",
  "Ethan Allen",
  "Amelia Scott",
  "Alexander Wright",
  "Harper Phillips",
  "Daniel Adams",
  "Abigail Hall",
  "Logan Baker"
];

class CreateEvent extends StatefulWidget {
  bool isVisible;
  CreateEvent({
    Key? key,
    required this.isVisible,
  }) : super(key: key);

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  int pageNo = 1;
  final size = Get.size;
  List categories = [];
  double val = 30;
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.isVisible,
      child: Container(
        height: size.height * 0.76,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          //border: Border.all(color: bgBlack, width: 1),
          boxShadow: [
            BoxShadow(
              color: bgBlack.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 12,
              offset: const Offset(0, 3),
            ),
          ],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${pageNo}/3'),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.isVisible = false;
                        });
                      },
                      child: Icon(Icons.clear))
                ],
              ),
              SizedBox(height: 18),
              Visibility(
                visible: pageNo == 1 ? true : false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FadeInDown(
                      child: const Text(
                          'Create your circle with\nsame passion & interest',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1)),
                    ),
                    SizedBox(height: 18),
                    FadeInDown(
                      child: const Text('Title',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.2)),
                    ),
                    SizedBox(height: 8),
                    SizedBox(
                      height: 48,
                      width: Get.width - 60,
                      child: TextField(
                        decoration: InputDecoration(
                            focusColor: primaryColor,
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                gapPadding: 8,
                                borderSide:
                                    BorderSide(color: bgBlack, width: 1)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                gapPadding: 8,
                                borderSide:
                                    BorderSide(color: bgBlack, width: 1))),
                      ),
                    ),
                    SizedBox(height: 10),
                    FadeInDown(
                      child: const Text('Interest',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.2)),
                    ),
                    SizedBox(height: 8),
                    FadeInDown(
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            height: 40,
                            width: 100,
                            decoration: BoxDecoration(
                              color: bgWhite,
                              border: Border.all(color: bgBlack, width: 0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.4),
                                  spreadRadius: 2,
                                  blurRadius: 12,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(child: Text('👩‍🎨 Artist')),
                          ),
                          SizedBox(width: 8),
                          GestureDetector(
                            onTap: (() {
                              setState(() {
                                categories.add('coffee');
                                print(categories);
                              });
                            }),
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              height: 40,
                              width: 100,
                              decoration: BoxDecoration(
                                color: categories.contains('coffee')
                                    ? bgBlack
                                    : bgWhite,
                                border: Border.all(color: bgBlack, width: 0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.4),
                                    spreadRadius: 2,
                                    blurRadius: 12,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                  child: Text(
                                '☕ Coffee',
                                style: TextStyle(
                                    color: categories.contains('coffee')
                                        ? bgWhite
                                        : bgBlack),
                              )),
                            ),
                          ),
                          SizedBox(width: 8),
                          GestureDetector(
                            onTap: () {
                              categories.add('coding');
                            },
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              height: 40,
                              width: 80,
                              decoration: BoxDecoration(
                                color: bgWhite,
                                border: Border.all(color: bgBlack, width: 0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.4),
                                    spreadRadius: 2,
                                    blurRadius: 12,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(child: Text('➕')),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    FadeInDown(
                      child: const Text('Location',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.2)),
                    ),
                    SizedBox(height: 8),
                    Container(
                      height: 180,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: FlutterMap(
                          options: MapOptions(
                            zoom: 13.0,
                            center: LatLng(19.2458117, 72.8),
                          ),
                          children: [
                            TileLayer(
                              urlTemplate:
                                  'https://api.mapbox.com/styles/v1/mapbox/streets-v11/tiles/{z}/{x}/{y}?access_token=pk.eyJ1IjoiaXNvc2NlbGVzIiwiYSI6ImNsZjI4YjhpeTBmeTI0NGxjdWt2emNnazgifQ.oObR7aEeGzuuP1yuwvGoUA',
                              subdomains: ['a', 'b', 'c'],
                            ),
                            MarkerLayer(markers: [
                              Marker(
                                width: 45,
                                height: 45,
                                point: LatLng(19.2458117, 72.8),
                                builder: ((context) => GestureDetector(
                                    onLongPress: () {
                                      print('long pressed');
                                    },
                                    child: ElasticIn(
                                        child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ElasticIn(
                                            child: PeopleIcons(
                                                45, 'assets/avatar1.svg')),
                                      ],
                                    )))),
                              ),
                            ]),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: GestureDetector(
                            onTap: () {
                              setState(() {
                                pageNo++;
                              });
                            },
                            child:
                                FadeInUp(child: CustomBtn(title: 'Continue')))),
                  ],
                ),
              ),
              Visibility(
                  visible: pageNo == 2 ? true : false,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FadeInLeft(
                        child: const Text(
                            'Filter your circle to get\nmore specific friends',
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 1)),
                      ),
                      SizedBox(height: 40),
                      FadeInLeftBig(
                        child: const Text('Age Range',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 1)),
                      ),
                      SizedBox(height: 20),
                      FadeInLeftBig(
                        child: Row(
                          children: const [
                            Chip(label: Text('16-18')),
                            SizedBox(width: 8),
                            Chip(label: Text('18-25 ')),
                            SizedBox(width: 8),
                            Chip(label: Text('25-40')),
                            SizedBox(width: 8),
                            Chip(label: Text('40+')),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      FadeInLeftBig(
                        child: const Text('Circle Distance',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1)),
                      ),
                      SizedBox(height: 50),
                      FadeInLeftBig(
                        child: Slider(
                          activeColor: bgBlack,
                          inactiveColor: primaryColor,
                          value: val,
                          onChanged: ((value) => setState(() {
                                val = value;
                              })),
                          min: 0,
                          max: 100,
                        ),
                      ),
                    ],
                  )),
              Visibility(
                visible: pageNo == 3 ? true : false,
                child: Column(
                  children: [
                    const Text('Invite Friends',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1)),
                    SizedBox(height: 18),
                    SizedBox(
                      child: SizedBox(
                        height: 350,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: names
                                .map((e) => FadeInLeft(
                                      delay: Duration(
                                          milliseconds:
                                              (names.indexOf(e) * 300)),
                                      child: Card(
                                        elevation: 1.1,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        margin: const EdgeInsets.only(
                                            top: 12, left: 10, right: 10),
                                        child: ListTile(
                                            leading: CircleAvatar(
                                              foregroundImage: NetworkImage(
                                                  images[Random().nextInt(5)]),
                                              radius: 20,
                                            ),
                                            title: Text(e),
                                            trailing: Chip(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 8,
                                                        vertical: 4),
                                                backgroundColor: bgBlack,
                                                label: Text(
                                                  'Invite',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ))),
                                      ),
                                    ))
                                .toList(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Visibility(
                  visible: pageNo == 4 ? true : false,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: lottie.Lottie.network(
                            'https://assets3.lottiefiles.com/packages/lf20_eXccgKjr0V.json',
                            height: 200),
                      ),
                      SizedBox(height: 38),
                      const Text('Creating Circle is Success',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          )),
                      SizedBox(
                        height: 18,
                      ),
                      const Text('new circle is created',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                            fontWeight: FontWeight.w400,
                          )),
                      SizedBox(height: 38),
                      GestureDetector(
                        onTap: () {
                          widget.isVisible = false;
                        },
                        child: CustomBtn(
                          title: 'Copy Link  🔗 ',
                        ),
                      ),
                      SizedBox(height: 18),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            pageNo = 1;
                          });
                        },
                        child: CustomBtn(
                          title: 'Back to Home ',
                        ),
                      ),
                      SizedBox(height: 38),
                    ],
                  )),
              SizedBox(height: 20),
              Visibility(
                  visible: pageNo == 4 || pageNo == 1 ? false : true,
                  child: Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  pageNo++;
                                });
                              },
                              child: FadeInUp(
                                  child: CustomBtn(title: 'Continue')))),
                      SizedBox(height: 20),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  pageNo++;
                                });
                              },
                              child: FadeInUpBig(
                                  child: CustomBtn(title: 'Back')))),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class CreateCirlce2 extends StatelessWidget {
  const CreateCirlce2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
