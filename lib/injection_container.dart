import 'package:get_it/get_it.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';

import 'features/txt_ocr/data/datasource/txt_ocr_datasource.dart';
import 'features/txt_ocr/data/datasource/txt_ocr_datasource_impl.dart';
import 'features/txt_ocr/data/repository/txt_ocr_repository_impl.dart';
import 'features/txt_ocr/domain/repository/txt_ocr_repository.dart';
import 'features/txt_ocr/domain/usecases/txt_ocr_usecase.dart';
import 'features/txt_ocr/presentation/bloc/txt_ocr_cubit.dart';

final s1 = GetIt.instance;

Future<void> init() async {
  //cubit
  s1.registerFactory(() => TxtOcrCubit(txtOcrUseCase: s1()));

  //datasource
  s1.registerLazySingleton<TxtOcrDataSource>(
      () => TxtOcrDataSourceImpl(textRecognizer: s1()));

  //repository
  s1.registerLazySingleton<TxtOcrRepository>(
      () => TxtOcrRepositoryImpl(txtOcrDataSource: s1()));

  //usecase
  s1.registerLazySingleton(() => TxtOcrUseCase(txtOcrRepository: s1()));

  //image picker
  s1.registerLazySingleton(() => ImagePicker());

  //text recognition
  s1.registerLazySingleton(() => GoogleMlKit.vision.textRecognizer());
}
