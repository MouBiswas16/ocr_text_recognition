// ignore_for_file: unused_field

import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _text = "";
  XFile? _xfile;
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Text Recognition"),
        actions: [
          TextButton(
            onPressed: scanText,
            child: Text(
              "Scan",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        child: Icon(Icons.add_a_photo),
      ),
      body: Column(
        children: [
          if (_xfile != null)
            Image.file(
              File(_xfile!.path),
              fit: BoxFit.fitWidth,
            ),
          Text("$_text"),
        ],
      ),
    );
  }

  Future scanText() async {
    showDialog(
      // this is not save, bt can do the trick, closing with Navigator.of(context).pop(); on end
      context: context,
      builder: (context) => Center(
        child: CircularProgressIndicator(),
      ),
    );
    if (_xfile == null) {
      log("got null on image file");
      return;
    }
    final inputImage = InputImage.fromFilePath(_xfile!.path);
    final textRecognizer = TextRecognizer();
    final recognizedText = await textRecognizer.processImage(inputImage);

    for (TextBlock block in recognizedText.blocks) {
      for (TextLine line in block.lines) {
        _text += line.text + "\n";
      }
    }

    log("data $_text");
    Navigator.of(context).pop();
    setState(() {}); // to update the ui.
  }

  Future getImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _xfile = pickedFile;
      } else {
        print("No image selected");
      }
    });
  }
}
