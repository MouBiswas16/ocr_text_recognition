// ignore_for_file: override_on_non_overriding_member

import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:ocr_text_recognition/core/error/failures.dart';

import '../../domain/repository/txt_ocr_repository.dart';
import '../datasource/txt_ocr_datasource.dart';
import '../models/txt_data_model.dart';

class TxtOcrRepositoryImpl extends TxtOcrRepository {
  final TxtOcrDataSource _txtOcrDataSource;

  TxtOcrRepositoryImpl({
    required TxtOcrDataSource txtOcrDataSource,
  }) : _txtOcrDataSource = txtOcrDataSource;

  @override
  Future<Either<Failures, TxtDataModel>> execute(File fileImage) async {
    return await _txtOcrDataSource.execute(fileImage);
  }
}
