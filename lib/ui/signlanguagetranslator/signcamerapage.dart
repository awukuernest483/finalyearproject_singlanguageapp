import 'package:camera/camera.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:signalator/ui/signlanguagetranslator/historysigntranslator.dart';
import 'package:signalator/widget/raisedbutton.dart';
import 'package:tflite/tflite.dart';

enum CameraType { Front, Back }

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  final currentUser = FirebaseAuth.instance.currentUser;

  bool isWorking = false;
  late CameraController controller;
  late List<CameraDescription> cameras;
  late CameraImage imgCamera;
  String name = '';
  String confidence = '';
  String label = '';
  String sentence = '';

  CameraType selectedCamera = CameraType.Back; // Default to the back camera

  loadModel() async {
    await Tflite.loadModel(
        model: "assets/tflite/model_unquant.tflite",
        labels: "assets/tflite/labels.txt");
  }

  @override
  void initState() {
    loadModel();
    super.initState();
    availableCameras().then((value) {
      cameras = value;
      if (cameras.isNotEmpty) {
        // Set the initial camera based on the selectedCamera variable
        CameraDescription initialCamera = selectedCamera == CameraType.Front
            ? cameras.first // Use the front camera
            : cameras.last; // Use the back camera
        controller = CameraController(initialCamera, ResolutionPreset.high);
        controller.initialize().then((_) {
          if (!mounted) {
            return;
          }
          setState(() {
            controller.startImageStream((imageFromStream) {
              if (!isWorking) {
                isWorking = true;
                imgCamera = imageFromStream;
                runModelOnStreamFrames();
              }
            });
          });
        });
      } else {}
    }).catchError((e) {});
  }

  runModelOnStreamFrames() async {
    var recognitions = await Tflite.runModelOnFrame(
        bytesList: imgCamera.planes.map((plane) {
          return plane.bytes;
        }).toList(),
        imageHeight: imgCamera.height,
        imageWidth: imgCamera.width,
        imageMean: 127.5,
        imageStd: 127.5,
        numResults: 1,
        threshold: 0.6,
        asynch: true);

    recognitions?.forEach((response) {
      label = response["label"];
      name = label.substring(2, label.length);
      confidence =
          ((response["confidence"] as double) * 100).toStringAsFixed(1) + " %";
    });

    if (mounted) {
      setState(() {
        //return result;
      });
    }
    isWorking = false;
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void toggleCamera() {
    setState(() {
      if (selectedCamera == CameraType.Front) {
        selectedCamera = CameraType.Back;
      } else {
        selectedCamera = CameraType.Front;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
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
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const signHistoryPage(),
                      ),
                    );
                  },
                  child: const Text(
                    "See History",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
              title: const Text("Capture Sign from camera"),
              backgroundColor:
                  Colors.transparent, // Make the AppBar transparent
              elevation: 0, // Remove the shadow of the AppBar
            ),
          ],
        ),
      ),
      body: cameraPreview(),
    );
  }

  Widget cameraPreview() {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference signHistory = firestore.collection("signHistory");
    if (controller == null || !controller.value.isInitialized) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            Text(
              'loading',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
      );
    }
    return Stack(
      children: [
        Positioned.fill(
          child: CameraPreview(controller),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Align(
            alignment: Alignment.topCenter,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(50), // Adjust the radius as needed
              ),
              color: Colors.black.withAlpha(20),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  "Detected Letter: $name\nConfidence: $confidence",
                  style: const TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
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
                  CircleAvatar(
                    radius: 35,
                    backgroundColor: const Color(0xFFFFFFFF),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          if (name == "26 Nothing") {
                            sentence = sentence + "";
                          } else if (name == "27 Delete") {
                            if (sentence.isNotEmpty) {
                              sentence =
                                  sentence.substring(0, sentence.length - 1);
                            } else {
                              sentence = sentence + "";
                            }
                          } else if (name == "28 Space") {
                            sentence = sentence + " ";
                          } else {
                            if (sentence.isNotEmpty) {
                              sentence = sentence + name.toLowerCase();
                            } else {
                              sentence = sentence + name;
                            }
                          }
                        });
                      },
                      icon: const Icon(
                        Icons.camera,
                        size: 35,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: RaisedButtonStyle,
                    child: const Text("Save Text",
                        style: TextStyle(color: Colors.black)),
                    onPressed: () {
                      if (sentence.isNotEmpty) {
                        signHistory.add({
                          "email": currentUser!.email,
                          "text": sentence,
                          "detail": "Saved from image detection"
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
              const SizedBox(height: 5),
              Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                height: 150,
                padding: const EdgeInsets.all(0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        "Formed Text:",
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Text(
                      sentence,
                      style: const TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
