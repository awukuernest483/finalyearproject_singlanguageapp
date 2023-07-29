import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:signalator/ui/signlanguagetranslator/historysigntranslator.dart';
import 'package:signalator/widget/raisedbutton.dart';
import 'package:tflite/tflite.dart';

import '../../widget/card_translator copy 2.dart';
import '../../widget/card_translator copy.dart';

class PickerScreen extends StatefulWidget {
  const PickerScreen({Key? key}) : super(key: key);

  @override
  _PickerScreenState createState() => _PickerScreenState();
}

class _PickerScreenState extends State<PickerScreen> {
  final currentUser = FirebaseAuth.instance.currentUser;
  late File pickedImage;
  bool isImageLoaded = false;
  late List result;
  String confidence = "";
  late String name;
  String detected = "";
  String sentence = "";

  getImageFromGallery() async {
    var tempStore = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (mounted) {
      setState(() {
        pickedImage = File(tempStore!.path);
        isImageLoaded = true;
        applyModelOnImage(File(tempStore.path));
      });
    }
  }

  applyModelOnImage(File file) async {
    var res = await Tflite.runModelOnImage(
      path: file.path,
      numResults: 2,
      threshold: 0.4,
      imageMean: 127.5,
      imageStd: 127.5,
    );

    if (mounted) {
      setState(() {
        result = res!;
        name = result[0]["label"];
        if (name == "26 Nothing") {
          sentence = sentence + "";
          detected = "Nothing";
        } else if (name == "27 Delete") {
          detected = "Delete";
          if (sentence.isNotEmpty) {
            sentence = sentence.substring(0, sentence.length - 1);
          } else {
            sentence = sentence + "";
          }
        } else if (name == "28 Space") {
          sentence = sentence + " ";
          detected = "Space";
        } else {
          if (sentence.isNotEmpty) {
            sentence =
                sentence + name[name.length - 1].toString().toLowerCase();
          } else {
            sentence = sentence + name[name.length - 1].toString();
          }
          detected = name[name.length - 1].toString();
        }
        confidence = result != null
            ? (result[0]['confidence'] * 100.0).toString().substring(0, 2) + "%"
            : "";
      });
    }
  }

  loadMyModel() async {
    var resultant = await Tflite.loadModel(
        model: "assets/tflite/model_unquant.tflite",
        labels: "assets/tflite/labels.txt");
    print('status load model: $resultant');
  }

  @override
  void initState() {
    super.initState();
    loadMyModel();
  }

  @override
  void dispose() {
    super.dispose();
    loadMyModel();
  }

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference signHistory = firestore.collection("signHistory");
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/images/background.png', // Replace with your background image asset path
                fit: BoxFit.fitWidth,
              ),
            ),
            AppBar(
              title: const Text("Capture Sign from Image"),
              backgroundColor:
                  Colors.transparent, // Make the AppBar transparent
              elevation: 0, // Remove the shadow of the AppBar
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            isImageLoaded
                ? Center(
                    child: Column(
                      children: [
                        Container(
                          height: 200,
                          width: 200,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: FileImage(File(pickedImage.path)),
                                  fit: BoxFit.contain)),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Detected Letter: $detected",
                          style: const TextStyle(fontSize: 25.0),
                        ),
                        Text(
                          "Confidence: $confidence",
                          style: const TextStyle(fontSize: 25.0),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              style: RaisedButtonStyle,
                              child: const Text(
                                "Backspace",
                                style: TextStyle(color: Colors.black),
                              ),
                              onPressed: () {
                                if (sentence.isNotEmpty) {
                                  setState(() {
                                    sentence = sentence.substring(
                                        0, sentence.length - 1);
                                  });
                                } else {
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: const Text("Blank Text"),
                                      content: const Text(
                                          "Please insert an image to form the text!"),
                                      actions: <Widget>[
                                        TextButton(
                                          child: const Text("Ok"),
                                          onPressed: () {
                                            Navigator.of(context).pop("Ok");
                                          },
                                        ),
                                      ],
                                    ),
                                  );
                                }
                              },
                            ),
                            const SizedBox(width: 10),
                            ElevatedButton(
                              style: RaisedButtonStyle,
                              child: const Text(
                                "Space",
                                style: TextStyle(color: Colors.black),
                              ),
                              onPressed: () {
                                setState(() {
                                  sentence = sentence + " ";
                                });
                              },
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "Formed Word: \n ",
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          sentence,
                          style: const TextStyle(fontSize: 20.0),
                        )
                      ],
                    ),
                  )
                : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              getImageFromGallery();
                            },
                            child: const cardTranslatorother2(
                              name: "Sign Languange Translator",
                              detail: "Capture from Camera",
                              pictureUrl:
                                  "https://images.unsplash.com/photo-1502159212845-f31a19546a5d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDN8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                  ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: RaisedButtonStyle,
                  child: const Text(
                    "Clear Text",
                    style: TextStyle(color: Colors.black),
                  ),
                  onPressed: () {
                    setState(() {
                      sentence = "";
                    });
                  },
                ),
                ElevatedButton(
                  style: RaisedButtonStyle,
                  child: const Text(
                    "Save Text",
                    style: TextStyle(color: Colors.black),
                  ),
                  onPressed: () {
                    if (sentence.isNotEmpty) {
                      signHistory.add({
                        "email": currentUser!.email,
                        "text": sentence,
                        "detail": "Saved from image picker"
                      });
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text(
                              'You have successfully saved this text into history')));
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text("Save Text Problem"),
                          content: const Text(
                              "Can\'t save because it doesn\'t translate to text"),
                          actions: <Widget>[
                            TextButton(
                              child: const Text("Ok"),
                              onPressed: () {
                                Navigator.of(context).pop("Ok");
                              },
                            ),
                          ],
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
