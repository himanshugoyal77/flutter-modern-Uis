import 'package:cat_ap/widgets/custom_appbar.dart';
import 'package:cat_ap/widgets/select_gender_card.dart';
import 'package:cat_ap/widgets/upload_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:cat_ap/constants.dart';
import 'package:intl/intl.dart';

import '../widgets/icon_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

int selectedIndex = 0;
int weight = 0;
String name = "";
String url = "";
String birthDate = "";

// final TextEditingController nameController = TextEditingController();

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    void saveToFirebase(context) {
      FirebaseFirestore.instance
          .collection("catInfo")
          .doc(DateTime.timestamp().toString())
          .set({
        "name": name,
        "gender": selectedIndex == 0 ? "female" : "male",
        "weight": weight,
        "image": url,
        "birthDate": birthDate
      }).then((value) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: const Text('Data added Successfully'),
          backgroundColor: Colors.black,
          elevation: 10,
          behavior: SnackBarBehavior.floating,
          margin:
              EdgeInsets.only(bottom: size.height - 100, right: 10, left: 10),
        ));
      });
    }

    return Scaffold(
      backgroundColor: bgWhite,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, top: 40, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppBar(),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Your cat's details",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.grey.shade800,
                  fontSize: 30,
                ),
              ),
              Text(
                "There are many variations of passages of Lorem Ipsum available, but the majority.",
                style: TextStyle(
                  color: Colors.grey.shade600,
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              Text(
                "Your cat's name",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.grey.shade800,
                    fontSize: 20),
              ),
              Container(
                margin: const EdgeInsets.only(top: 8),
                height: 48,
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white),
                child: TextField(
                  onChanged: (value) => setState(() {
                    name = value;
                  }),
                  cursorColor: Colors.grey,
                  decoration: const InputDecoration(
                      border: InputBorder.none, focusColor: Colors.black),
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              Text(
                "Your cat's picture",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.grey.shade800,
                    fontSize: 20),
              ),
              UploadWidget(url: url),
              const SizedBox(
                height: 18,
              ),
              Text(
                "Gender",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.grey.shade800,
                    fontSize: 20),
              ),
              const SizedBox(
                height: 6,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        selectedIndex = 0;
                      });
                    },
                    child: GenderCard(
                      size: size,
                      gender: "Female",
                      icon: Icons.female_rounded,
                      selectedIndex: selectedIndex,
                      id: 0,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        selectedIndex = 1;
                      });
                    },
                    child: GenderCard(
                      size: size,
                      gender: "Male",
                      icon: Icons.male_rounded,
                      selectedIndex: selectedIndex,
                      id: 1,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                "Date of birth",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.grey.shade800,
                    fontSize: 20),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2101),
                          builder: (context, child) {
                            return Theme(
                              data: ThemeData.light().copyWith(
                                colorScheme: const ColorScheme.light(
                                  onPrimary:
                                      Colors.black, // selected text color
                                  onSurface: Colors.black, // default text color
                                  primary: Colors.blue, // circle color
                                ),
                                dialogBackgroundColor: Colors.white,
                              ),
                              child: child!,
                            );
                          });

                      if (pickedDate != null) {
                        print(pickedDate);
                        String formattedDate =
                            DateFormat('yyyy-MM-dd').format(pickedDate);

                        setState(() {
                          birthDate = formattedDate;
                        });
                      } else {
                        print("Date is not selected");
                      }
                    },
                    child: Container(
                      width: size.width - 100,
                      height: 50,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 0),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              bottomLeft: Radius.circular(12)),
                          color: Colors.white38),
                      child: IgnorePointer(
                        child: TextField(
                          cursorColor: Colors.grey,
                          readOnly: true,
                          decoration: InputDecoration(
                              hintText:
                                  birthDate == "" ? "DD/MM/YYYY" : birthDate,
                              hintStyle: TextStyle(color: Colors.grey.shade300),
                              border: InputBorder.none,
                              focusColor: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      print("tapped");
                    },
                    child: const WidgetIcon(
                      height: 50,
                      width: 60,
                      icon: Icons.calendar_today_outlined,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                "Current weight (in kg)",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.grey.shade700,
                    fontSize: 20),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (weight == 0) {
                          return;
                        }
                        weight--;
                      });
                    },
                    child: Container(
                        width: 70,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(8)),
                        child: const Icon(
                          Icons.remove_outlined,
                          color: Colors.grey,
                          size: 25,
                        )),
                  ),
                  Container(
                    width: size.width - 180,
                    height: 50,
                    child: Center(
                      child: Text(
                        weight.toString(),
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => setState(() {
                      weight++;
                    }),
                    child: Container(
                        width: 70,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(8)),
                        child: const Icon(
                          Icons.add,
                          color: Colors.grey,
                          size: 25,
                        )),
                  ),
                ],
              ),
              InkWell(
                onTap: () {
                  if (birthDate == "" || name == "" || weight == 0) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: const Text('please fill the details first'),
                      backgroundColor: Colors.black,
                      elevation: 10,
                      behavior: SnackBarBehavior.floating,
                      margin: EdgeInsets.only(
                          bottom: size.height - 100, right: 10, left: 10),
                    ));
                    return;
                  }
                  saveToFirebase(context);
                },
                child: Container(
                  height: 60,
                  width: size.width,
                  margin: const EdgeInsets.only(top: 30, bottom: 20),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 12.0),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20)),
                  child: const Center(
                    child: Text("Save and porceed",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
