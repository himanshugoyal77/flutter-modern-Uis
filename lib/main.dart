import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sports_app/constants.dart';
import 'package:sports_app/screens/home_page.dart';
import 'package:sports_app/screens/temp.dart';

import 'constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: HomePage());
  }
}

class WidgetWrapper extends StatelessWidget {
  const WidgetWrapper({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
