import 'dart:convert';

import 'package:todos/core/utils/keys.dart';
import 'package:todos/data/models/task.dart';
import 'package:todos/data/services/storage/services.dart';
import 'package:get/get.dart';

class TaskProvider {
  final StoargeService _storage = Get.find<StoargeService>();

  List<Task> readTasks() {
    var tasks = <Task>[];
    jsonDecode(_storage.read(taskKey).toString()).forEach((e)=> 
    tasks.add(Task.fromJson(e)));
    return tasks;
  }

  void writeTasks(List<Task> tasks) {
    _storage.wrtie(taskKey, jsonEncode(tasks));
  }
}
