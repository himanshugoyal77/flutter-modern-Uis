import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding:  EdgeInsets.symmetric(horizontal: 20, vertical: 22),
      child: SizedBox(
        height: 50,
        child: TextField(
          cursorHeight: 25,
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              hintText: 'Search'),
        ),
      ),
    );
  }
}
