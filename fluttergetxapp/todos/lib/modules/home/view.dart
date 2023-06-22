import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todos/data/models/task.dart';
import 'package:todos/modules/home/controller.dart';
import 'package:todos/core/utils/extension.dart';
import 'package:todos/widgets/add_card.dart';
import 'package:todos/widgets/task_card..dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Padding(
            padding: EdgeInsets.all(4.0.wp),
            child: Text(
              "My List",
              style: TextStyle(
                fontSize: 24.0.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            children: [
              ...controller.tasks.map((task) => TaskCard(task: task)).toList(),
              AddCard(),
            ],
          ),
        ],
      )),
    );
  }
}
