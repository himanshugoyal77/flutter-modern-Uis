import 'package:flutter/material.dart';

class GenderCard extends StatelessWidget {
  const GenderCard(
      {super.key,
      required this.size,
      required this.icon,
      required this.gender,
      required this.selectedIndex,
      required this.id});

  final Size size;
  final IconData icon;
  final String gender;
  final int selectedIndex;
  final int id;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: size.width / 2 - 25,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              offset: Offset(-1, 1),
              spreadRadius: -3,
              blurRadius: 4,
              color: Color.fromRGBO(0, 0, 0, 1),
            )
          ],
          borderRadius: BorderRadius.circular(12),
          border:
              id == selectedIndex ? Border.all(color: Colors.grey) : Border()),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Transform.rotate(
            angle: gender == "Male" ? 0 : 10,
            child: Icon(
              icon,
              color: selectedIndex == id ? Colors.blue : Colors.grey,
              size: 40,
            ),
          ),
          Text(
            gender,
            style: const TextStyle(color: Colors.grey, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
