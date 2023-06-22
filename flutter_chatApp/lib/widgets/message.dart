import 'package:chat_app/component/single_message.dart';
import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  const Message({super.key});

  @override
  Widget build(BuildContext context) {
    List messages = [
      {
        "url":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-iqU6LhNo3F8Bcs1ZC8TyrdR1ueQr1O9Yy_VylDkx&s",
        "name": "Jorden",
        "message": "Hii!",
        "time": "13:10",
        "badge": "1",
        "isverfied": "true"
      },
      {
        "name": "Tim",
        "url":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMRDU4HXq8lUyby3h4ie-TjuWhHKu1HxgFXNsePTZ0&s",
        "message": "Hii!",
        "time": "13:10",
        "badge": "NULL",
        "isverfied": "true"
      },
      {
        "url":
            "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fA%3D%3D&w=1000&q=80",
        "name": "Tony",
        "message": "Typing",
        "time": "13:10",
        "badge": "9",
        "isverfied": "false"
      }
    ];
    return Column(
      children: [
        Column(
            children: messages
                .map((e) => SingleMeassage(
                      event: e,
                    ))
                .toList())
      ],
    );
  }
}
