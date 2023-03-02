import 'package:equatable/equatable.dart';

import '../../data/models/txt_data_model.dart';

abstract class TxtOcrState extends Equatable {
  const TxtOcrState();
  @override
  List<Object> get props => [];
}

class TxtOcrInitial extends TxtOcrState {}

class TxtOnLoading extends TxtOcrState {}

class TxtOnScanError extends TxtOcrState {}

class TxtOnScanSuccess extends TxtOcrState {
  final String message;
  final TxtDataModel txtDataModel;

  const TxtOnScanSuccess({
    required this.message,
    required this.txtDataModel,
  });

  @override
  List<Object> get props => [message, txtDataModel];
}
