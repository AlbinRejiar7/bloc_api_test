part of 'api_bloc.dart';

abstract class ApiState extends Equatable {
  const ApiState();

  @override
  List<Object?> get props => [];
}

class InitialData extends ApiState {}

class LoadingData extends ApiState {}

class LoadedData extends ApiState {
  final List<ApiModel> apiModel;
  const LoadedData({required this.apiModel});
}

class DataError extends ApiState {
  final String? message;
  const DataError({required this.message});
}
