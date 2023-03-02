import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../data/models/txt_data_model.dart';

abstract class TxtOcrRepository {
  Future<Either<Failures, TxtDataModel>> execute(File fileImage);
}
