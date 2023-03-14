import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../bloc/txt_ocr_cubit.dart';
import '../bloc/txt_ocr_state.dart';
import '../pages/detail_text_recognition.dart';

class TakePicture extends StatefulWidget {
  final CameraDescription cameraDescription;
  TakePicture({
    super.key,
    required this.cameraDescription,
  });

  @override
  State<TakePicture> createState() => _TakePictureState();
}

class _TakePictureState extends State<TakePicture> {
  CameraController? _controller; // cameraController
  Future? _initializeControllerFuture;
  File? file;

  @override
  void initState() {
    super.initState();
    _controller =
        CameraController(widget.cameraDescription, ResolutionPreset.max);
    _controller?.initialize();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TxtOcrCubit, TxtOcrState>(
      listener: (context, state) {
        if (state is TxtOnScanSuccess) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailTextRecognition(
                txtDataModel: state.txtDataModel,
              ),
            ),
          );
        }
      },
      child: Scaffold(
        body: FutureBuilder<void>(
          future: availableCameras(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }
            if (snapshot.connectionState == ConnectionState.none) {
              return Center(
                child: Text("No Image Selected."),
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: Text("Error While Loading Images"),
              );
            }
            if (snapshot.hasData) {
              return Center(
                child: Column(
                  children: [
                    if (_controller == null)
                      Image.file(
                        File(file!.path),
                        fit: BoxFit.fitWidth,
                      ),
                  ],
                ),
              );
            } else {
              return CircularProgressIndicator.adaptive();
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          // onPressed: () async {
          //   try {
          //     await _initializeControllerFuture;
          //     final image = await _controller?.takePicture();
          //     _image = File(image?.path as String);
          //     BlocProvider.of<TxtOcrCubit>(context).scanTxt(_image!);
          //   } catch (e) {
          //     if (kDebugMode) {
          //       print(e);
          //     }
          //   }
          // },
          // onPressed: imagePickerOptions,
          onPressed: () async {
            try {
              await _initializeControllerFuture;
              final fetchedFile = await imagePickerOptions();
              if (fetchedFile == null) {
                debugPrint("got null file");
              }
              BlocProvider.of<TxtOcrCubit>(context).scanTxt(fetchedFile!);
            } catch (e) {
              if (kDebugMode) {
                print(e);
              }
            }
          },
          child: Icon(
            Icons.camera_alt,
          ),
        ),
      ),
    );
  }

  Future<File?> imagePickerOptions() async {
    final result = await showModalBottomSheet<File?>(
      backgroundColor: Colors.white,
      context: context,
      builder: (context) {
        return Wrap(
          children: [
            ListTile(
                leading: Icon(
                  Icons.photo_outlined,
                ),
                title: Text("Gallery"),
                onTap: () async {
                  final result = await _pickImage(ImageSource.gallery);
                  Navigator.of(context).pop(result);
                }),
            ListTile(
              leading: Icon(Icons.camera_alt_outlined),
              title: Text("Camera"),
              onTap: () async {
                final result = await _pickImage(ImageSource.camera);
                Navigator.of(context).pop(result);
              },
            ),
          ],
        );
      },
    );

    return result;
  }

  Future<Object?> _pickImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    try {
      // final image = await ImagePicker().pickImage(source: source);
      if (image == null) return null;
      File? img = File(image.path);

      return img;
    } on PlatformException catch (e) {
      print(e);
      Navigator.of(context).pop();
    }
    return image;
  }
}
