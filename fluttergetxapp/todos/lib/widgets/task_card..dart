import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:todos/core/utils/extension.dart';
import 'package:todos/data/models/task.dart';
import 'package:todos/modules/home/controller.dart';

class TaskCard extends StatelessWidget {
  final homeCtrl = Get.find<HomeController>();
  final Task task;
  TaskCard({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = HexColor.fromHex(task.color);
    var squarewidth = Get.width - 12.0.wp;
    return Container(
      width: squarewidth / 2,
      height: squarewidth / 2,
      margin: EdgeInsets.all(3.0.wp),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.grey[300]!,
          //spreadRadius: 1,
          blurRadius: 7,
          offset: const Offset(0, 7),
        ),
      ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StepProgressIndicator(
            totalSteps: 100,
            currentStep: 80,
            size: 5,
            padding: 0,
            selectedGradientColor: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [color.withOpacity(0.5), color],
            ),
            unselectedColor: Colors.white,
          ),
          Padding(
            padding: EdgeInsets.all(6.0.wp),
            child: Icon(IconData(task.icon, fontFamily: 'MaterialIcons'),
                color: Colors.grey),
          ),
          Padding(
            padding: EdgeInsets.all(6.0.wp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task.title,
                  style:
                      TextStyle(fontSize: 12.0.sp, fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 2.0.wp),
                Text(
                  "${task.todos?.length ?? 0} Task",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
