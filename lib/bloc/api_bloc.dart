import 'package:bloc/bloc.dart';
import 'package:bloc_api_test/resources/api_model.dart';
import 'package:bloc_api_test/resources/api_repositery.dart';
import 'package:equatable/equatable.dart';

part 'api_event.dart';
part 'api_state.dart';

class ApiBloc extends Bloc<ApiEvent, ApiState> {
  ApiBloc() : super(InitialData()) {
    final ApiRepository apiRepository = ApiRepository();

    on<GetDataList>((event, emit) async {
      try {
        emit(LoadingData());
        final List<ApiModel> apiList = await apiRepository.fetchDataList();
        emit(LoadedData(apiModel: apiList));
      } on NetworkError {
        emit(const DataError(
            message: "Failed to fetch data !!!! is your device online"));
      }
    });
  }
}
