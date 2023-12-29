import 'package:bloc_api_test/resources/api_model.dart';
import 'package:dio/dio.dart';

class ApiProvider {
  final Dio _dio = Dio();
  final String _url = "https://jsonplaceholder.typicode.com/photos#";

  Future<List<ApiModel>> fetchData() async {
    try {
      Response response = await _dio.get(_url);
      List<dynamic> value = response.data as List;
      return value.map((e) => ApiModel.fromJson(e)).toList();
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return [ApiModel.withError("Data not found / Connection issue")];
    }
  }
}
