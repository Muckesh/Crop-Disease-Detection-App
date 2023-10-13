import 'package:crop_disease_detection/constants/constants.dart';
import 'package:crop_disease_detection/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:page_transition/page_transition.dart';

class DetectionScreen extends StatefulWidget {
  @override
  _DetectionScreenState createState() => _DetectionScreenState();
}

class _DetectionScreenState extends State<DetectionScreen> {
  File? _image;
  List<dynamic>? _recognitions;

  @override
  void initState() {
    super.initState();
    loadModel();
  }

  Future<void> loadModel() async {
    await Tflite.loadModel(
      model: "assets/models/model2.tflite",
      labels: "assets/models/labels2.txt",
      isAsset: true,
    );
  }

  Future<void> _runInference() async {
    final imageFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (imageFile == null) return;

    setState(() {
      _image = File(imageFile.path);
    });

    final recognitions = await Tflite.runModelOnImage(
      path: imageFile.path,
      numResults: 5,
      threshold: 0.2,
    );

    setState(() {
      _recognitions = recognitions;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.push(
                context,
                PageTransition(
                    child: const MainScreen(),
                    type: PageTransitionType.rightToLeft),
              );
            },
            child: Icon(
              Icons.arrow_back_ios_new,
              color: Constants.blackColor,
            )),
        title: Text(
          'Disease Detection',
          style: TextStyle(
            color: Constants.primaryColor,
            fontWeight: FontWeight.w500,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Center(
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Image.asset(
                    'assets/images/code-scan.png',
                    height: 200,
                    width: 200,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text("Scan The Image")
                ],
              ),
              Spacer(),
              // or

              const Row(
                children: [
                  Expanded(
                    child: Divider(),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Text("OR"),
                  ),
                  Expanded(
                    child: Divider(),
                  ),
                ],
              ),
              // or
              Spacer(),
              Column(
                children: [
                  _image != null
                      ? Image.file(
                          _image!,
                          height: 200,
                        )
                      : const Text('No image selected'),
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith(
                            (Color) => Constants.primaryColor)),
                    onPressed: _runInference,
                    child: const Text('Select an Image for Detection'),
                  ),
                ],
              ),
              Spacer(),
              _recognitions != null
                  ? Text('Recognition Results: $_recognitions')
                  : const Text('No recognition results yet'),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }
}
