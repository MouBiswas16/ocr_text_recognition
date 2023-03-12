import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ocr_text_recognition/features/txt_ocr/presentation/bloc/txt_ocr_cubit.dart';
import 'package:ocr_text_recognition/features/txt_ocr/presentation/pages/text_recognition.dart';
import 'package:ocr_text_recognition/firebase_options.dart';
import 'injection_container.dart' as di;
import 'injection_container.dart';

CameraDescription? cameraDescription; //camera

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final camera = await availableCameras();
  final firstCamera = camera.first;
  cameraDescription = firstCamera;
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Ocr Text Recognition",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => s1<TxtOcrCubit>(),
          ),
        ],
        child: TextRecognition(
          cameraDescription: cameraDescription!,
        ),
      ),
    );
  }
}
