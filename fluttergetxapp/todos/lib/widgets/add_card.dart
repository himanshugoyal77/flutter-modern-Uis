import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:todos/core/values/colors.dart';
import 'package:todos/modules/home/controller.dart';
import 'package:todos/core/utils/extension.dart';
import 'package:todos/widgets/icons.dart';

import '../data/models/task.dart';

class AddCard extends StatelessWidget {
  final homeCtrl = Get.find<HomeController>();
  AddCard({super.key});

  @override
  Widget build(BuildContext context) {
    final icons = getIcons();
    var squarewidth = Get.width - 12.0.wp;
    return Container(
      width: squarewidth / 2,
      height: squarewidth / 2,
      margin: EdgeInsets.all(3.0.wp),
      child: InkWell(
          onTap: () async {
            await Get.defaultDialog(
                titlePadding: EdgeInsets.symmetric(vertical: 5.0.wp),
                radius: 5,
                title: 'Task Type',
                content: Form(
                    key: homeCtrl.formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 3.0.wp),
                          child: TextFormField(
                            controller: homeCtrl.editingController,
                            decoration: InputDecoration(
                              labelText: 'Title',
                              border: OutlineInputBorder(),
                            ),
                            validator: ((value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Please enter title';
                              }
                              return null;
                            }),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 5.0.wp),
                          child: Wrap(
                              spacing: 2.0.wp,
                              children: icons
                                  .map((e) => Obx(() {
                                        final index = icons.indexOf(e);
                                        return ChoiceChip(
                                          selectedColor: Colors.grey[200]!,
                                          pressElevation: 0,
                                          backgroundColor: Colors.white,
                                          label: e,
                                          selected:
                                              homeCtrl.chipIndex.value == index,
                                          onSelected: (bool selected) {
                                            homeCtrl.chipIndex.value =
                                                selected ? index : 0;
                                          },
                                        );
                                      }))
                                  .toList()),
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: blue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                minimumSize: const Size(150, 40)),
                            onPressed: () {
                              print(homeCtrl.chipIndex.value);

                              if (homeCtrl.formKey.currentState!.validate()) {
                                int icon = icons[homeCtrl.chipIndex.value]
                                    .icon!
                                    .codePoint;
                                String color = icons[homeCtrl.chipIndex.value]
                                    .color
                                    .toString()
                                    .substring(8, 16);
                                var task = Task(
                                  title: homeCtrl.editingController.text,
                                  icon: icon,
                                  color: color,
                                );
                                print(
                                  icon,
                                );
                                print(color);
                                Get.back();
                                homeCtrl.addTask(task)
                                    ? EasyLoading.showSuccess("Create success")
                                    : EasyLoading.showError(
                                        "Duplicated failed");
                              }
                            },
                            child: const Text("Confirm"))
                      ],
                    )));
            homeCtrl.editingController.clear();
            homeCtrl.changeChipIndex(0);
          },
          child: DottedBorder(
            color: Colors.grey[400]!,
            dashPattern: const [8, 4],
            child: Center(
                child: Icon(
              Icons.add,
              color: Colors.grey,
              size: 10.0.wp,
            )),
          )),
    );
  }
}
