import 'package:chat_app/widgets/custom_appbar.dart';
import 'package:chat_app/widgets/main_slider.dart';
import 'package:chat_app/widgets/message.dart';
import 'package:chat_app/widgets/searchbar.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50]!.withOpacity(0.9),
      body: Stack(
        children: [
          const Positioned(top: 8, right: 0, left: 0, child: CustomAppBar()),
          const Positioned(top: 55, right: 0, left: 0, child: MainSlider()),
          Positioned(
              top: 270,
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.only(
                  top: 40,
                ),
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                ),
                child: const Message(),
              )),
          const Positioned(top: 230, right: 30, left: 30, child: SearchBar()),
        ],
      ),
    );
  }
}
