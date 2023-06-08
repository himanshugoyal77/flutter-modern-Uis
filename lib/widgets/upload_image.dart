import 'dart:io';

import 'package:cat_ap/screens/home_screen.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import 'package:cat_ap/widgets/icon_widget.dart';

class UploadWidget extends StatefulWidget {
  final String url;
  const UploadWidget({
    Key? key,
    required this.url,
  }) : super(key: key);

  @override
  State<UploadWidget> createState() => _UploadWidgetState();
}

class _UploadWidgetState extends State<UploadWidget> {
  File? image;
  UploadTask? uploadTask;

  uploadImage(source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() {
        this.image = imageTemp;
      });
      uploadToFirebase();
    } on PlatformException catch (e) {
      print("an erroe occures  ${e}");
    }
  }

  uploadToFirebase() async {
    final path = "cat/${image!.absolute.toString().substring(34)}";
    final file = File(image!.path);
    final ref = FirebaseStorage.instance.ref().child(path);
    uploadTask = ref.putFile(file);

    final snapshot = await uploadTask!.whenComplete(() => {});
    final urlDownload = await snapshot.ref.getDownloadURL();
    print("download Link ${urlDownload}");
    setState(() {
      url = urlDownload;
    });
  }

  @override
  Widget build(BuildContext context) {
    _showBottomSheet(context) {
      showBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: const EdgeInsets.all(20),
              height: 370,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(-2, -5),
                      spreadRadius: -3,
                      blurRadius: 2,
                      color: Color.fromRGBO(0, 0, 0, 1),
                    )
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Your cat's details",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 26,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  //uplaod image from camera
                  InkWell(
                    onTap: () {
                      uploadImage(ImageSource.camera);

                      Navigator.pop(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.black),
                      ),
                      child: const Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: WidgetIcon(
                                icon: CupertinoIcons.camera,
                                isAllRounded: true,
                                height: 60,
                                width: 60),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "Take a picture",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  //uplaod image from gallery
                  InkWell(
                    onTap: () {
                      uploadImage(ImageSource.gallery);

                      Navigator.pop(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: const Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: WidgetIcon(
                                icon: CupertinoIcons.folder,
                                isAllRounded: true,
                                height: 60,
                                width: 60),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "Upload from gallery",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const CancelButton(),
                  )
                ],
              ),
            );
          });
    }

    return InkWell(
      onTap: () {
        _showBottomSheet(context);
      },
      child: Container(
        margin: const EdgeInsets.only(top: 8),
        height: 110,
        width: 110,
        decoration: BoxDecoration(boxShadow: const [
          BoxShadow(
            offset: Offset(3, 3),
            spreadRadius: -3,
            blurRadius: 5,
            color: Colors.grey,
          )
        ], borderRadius: BorderRadius.circular(8), color: Colors.grey.shade100),
        child: const Opacity(
          opacity: 0.5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                CupertinoIcons.photo,
                color: Colors.blue,
                size: 30,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "upload",
                style: TextStyle(color: Colors.blue, fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CancelButton extends StatelessWidget {
  const CancelButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 62,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black),
      ),
      child: const Center(
        child: Text(
          "Cancel",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
