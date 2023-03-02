import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ocr_text_recognition/features/txt_ocr/presentation/bloc/txt_ocr_state.dart';

import '../../domain/usecases/txt_ocr_usecase.dart';

class TxtOcrCubit extends Cubit<TxtOcrState> {
  final TxtOcrUseCase _txtOcrUseCase;

  TxtOcrCubit({
    required TxtOcrUseCase txtOcrUseCase,
  })  : _txtOcrUseCase = txtOcrUseCase,
        super(TxtOcrInitial());

  Future<void> scanTxt(File fileImage) async {
    emit(TxtOnLoading());
    final result = await _txtOcrUseCase.call(fileImage);
    result.fold((failures) {
      emit(TxtOnScanError());
    }, (response) {
      emit(TxtOnScanSuccess(
        message: "Success",
        txtDataModel: response,
      ));
    });
  }
}
