// ignore_for_file: unused_local_variable, unnecessary_null_comparison

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
  String cell = "";
  String _text = "";
  XFile? _xfile;

  RegExp regExp = RegExp(
    r"^(?:\+?88|0088)?01[15-9]\d{8}$",
    caseSensitive: false,
    multiLine: false,
  );
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              if (_xfile != null)
                Image.file(
                  File(_xfile!.path),
                  fit: BoxFit.fitWidth,
                ),
              SelectableText("$_text"),
              // Text("Email address: " + regExp.allMatches("$_text").toString()),
              Text(
                "cell $cell",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }

  int getNumberOnly(String text) => int.parse(
        text.replaceAll(RegExp('[^0-9]'), ''),
      );

  Future scanText() async {
    showDialog(
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
        if (line.text.toLowerCase().contains("cell")) {
          cell = getNumberOnly(line.text.trim()).toString();
        }
        _text += line.text + "\n";
      }
    }

    log("data $_text");
    Navigator.of(context).pop();
    setState(() {});
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
