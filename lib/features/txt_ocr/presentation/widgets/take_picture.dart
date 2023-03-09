import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/txt_ocr_cubit.dart';
import '../bloc/txt_ocr_state.dart';
import '../pages/detail_text_recognition.dart';

class TakePicture extends StatefulWidget {
  final CameraDescription cameraDescription;
  const TakePicture({super.key, required this.cameraDescription});

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
          future: _initializeControllerFuture,
          // future: CameraController.initialize(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Stack(
                children: [
                  CameraPreview(_controller!),
                  FocusRectangle(
                    color: Colors.cyan,
                  )
                ],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            try {
              await _initializeControllerFuture;
              final image = await _controller?.takePicture();
              file = File(image?.path as String);
              BlocProvider.of<TxtOcrCubit>(context).scanTxt(file!);
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
}

class FocusRectangle extends StatelessWidget {
  final Color? color;

  const FocusRectangle({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: Column(
            children: [
              Flexible(
                flex: 1,
                child: Container(),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: AspectRatio(
                  aspectRatio: (1.56 / 1),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: color ?? Colors.white,
                        width: 2,
                      ),
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
