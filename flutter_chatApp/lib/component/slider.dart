import 'package:flutter/material.dart';

class CustomSlider extends StatelessWidget {
  const CustomSlider({super.key});

  @override
  Widget build(BuildContext context) {
    List status = [
      {
        "url":
            "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fA%3D%3D&w=1000&q=80",
        "name": "Tony",
      },
      {
        "url":
            "https://images.unsplash.com/photo-1557862921-37829c790f19?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8bWFufGVufDB8fDB8fA%3D%3D&w=1000&q=80",
        "name": "James"
      },
      {
        "url":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-iqU6LhNo3F8Bcs1ZC8TyrdR1ueQr1O9Yy_VylDkx&s",
        "name": "Jorden"
      }
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: status.map((e) => StatusCard(e)).toList()),
    );
  }
}

Widget StatusCard(dynamic event) {
  return Stack(
    children: [
      Container(
        margin: const EdgeInsets.only(left: 18),
        width: 90,
        height: 140,
      ),
      Container(
        margin: const EdgeInsets.only(left: 18),
        height: 110,
        width: 90,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
                image: NetworkImage(event["url"]), fit: BoxFit.cover)),
      ),
      Positioned(
          bottom: 20,
          left: 10,
          right: 10,
          child: Container(
              margin: const EdgeInsets.only(left: 18),
              height: 20,
              width: 60,
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    color: Color(0xffDDDDDD),
                    blurRadius: 2.0,
                    spreadRadius: 0.6,
                    offset: Offset(0.44, 0.0),
                  )
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(event["name"]),
              ))),
    ],
  );
}
