import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: 50,
        child: TextField(
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.location_on,
              color: Colors.black,
            ),
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
          ),
        ),
      ),
    );
  }
}
