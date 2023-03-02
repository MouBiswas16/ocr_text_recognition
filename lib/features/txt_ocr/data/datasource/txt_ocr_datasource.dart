import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../models/txt_data_model.dart';

abstract class TxtOcrDataSource {
  Future<Either<Failures, TxtDataModel>> execute(File fileImage);
}
