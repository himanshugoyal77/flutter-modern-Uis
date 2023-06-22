import 'package:get/get.dart';
import 'package:todos/data/provider/task/provider.dart';
import 'package:todos/data/services/storage/repository.dart';
import 'package:todos/modules/home/controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController(
        taskRepository: TaskRepository(taskProvider: TaskProvider())));
  }
}
