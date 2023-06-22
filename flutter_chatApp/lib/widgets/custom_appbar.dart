import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    "https://images.unsplash.com/photo-1611637576109-b6f76185ec9b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8Ym95c3xlbnwwfHwwfHw%3D&w=1000&q=80"),
              ),
            ),
          ),
          Text(
            "Puzzels",
            style: TextStyle(color: Colors.pink[200], fontSize: 24),
          ),
          const Icon(
            Icons.menu,
            size: 30,
          )
        ],
      ),
    );
  }
}
