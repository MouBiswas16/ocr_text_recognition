import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import '../widgets/take_picture.dart';

class TextRecognition extends StatefulWidget {
  final CameraDescription cameraDescription;
  const TextRecognition({Key? key, required this.cameraDescription})
      : super(key: key);

  @override
  State<TextRecognition> createState() => _TextRecognitionState();
}

class _TextRecognitionState extends State<TextRecognition> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ocr Text Recognition"),
        centerTitle: true,
      ),
      body: TakePicture(cameraDescription: widget.cameraDescription),
    );
  }
}
