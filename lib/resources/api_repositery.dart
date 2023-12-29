import 'package:bloc_api_test/resources/api_model.dart';

import 'api_provider.dart';

class ApiRepository {
  final _provider = ApiProvider();

  Future<List<ApiModel>> fetchDataList() {
    return _provider.fetchData();
  }
}

class NetworkError extends Error {}
