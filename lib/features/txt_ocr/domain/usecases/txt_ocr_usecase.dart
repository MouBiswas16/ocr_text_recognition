import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:ocr_text_recognition/core/error/failures.dart';

import '../../../../core/usecases/usecases.dart';
import '../../data/models/txt_data_model.dart';
import '../repository/txt_ocr_repository.dart';

class TxtOcrUseCase implements UseCase<TxtDataModel, File> {
  final TxtOcrRepository _txtOcrRepository;

  TxtOcrUseCase({
    required TxtOcrRepository txtOcrRepository,
  }) : _txtOcrRepository = txtOcrRepository;

  @override
  Future<Either<Failures, TxtDataModel>> call(File fileImage) async {
    final result = await _txtOcrRepository.execute(fileImage);

    return result;
  }
}

class Params extends Equatable {
  const Params();
  @override
  List<Object?> get props => [];
}
