import 'dart:developer';

import 'package:mobile_software_engineer/core/core.dart';

import '../../infra/datasources/check_internet_datasource.dart';

class CheckInternetDataSourceImpl extends CheckInternetDataSource {
  final RestClient client;
  CheckInternetDataSourceImpl({
    required this.client,
  });

  @override
  Future<RestClientResponse> checkInternet() async {
    try {
      final String path = const String.fromEnvironment('CHECK_INTERNET_URL');
      final baseResponse = await client.request(RestClientRequest(
        path: path,
        method: RestMethod.get,
        receiveTimeout: const Duration(seconds: 1),
      ));
      return baseResponse;
    } on BaseException catch (_) {
      rethrow;
    } catch (e) {
      log(e.toString(), name: 'CheckInternetDataSourceImpl');
      rethrow;
    }
  }
}
