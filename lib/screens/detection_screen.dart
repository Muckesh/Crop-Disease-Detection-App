import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter_tflite/flutter_tflite.dart';

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
        title: const Text('Plant Detection'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _image != null
                ? Image.file(
                    _image!,
                    height: 200,
                  )
                : const Text('No image selected'),
            ElevatedButton(
              onPressed: _runInference,
              child: Text('Select an Image for Detection'),
            ),
            _recognitions != null
                ? Text('Recognition Results: $_recognitions')
                : const Text('No recognition results yet'),
          ],
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
