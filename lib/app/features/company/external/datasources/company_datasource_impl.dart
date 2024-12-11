import 'dart:developer';

import 'package:mobile_software_engineer/app/app_url.dart';
import 'package:mobile_software_engineer/core/core.dart';

import '../../infra/datasources/company_datasource.dart';

class CompanyDatasourceImpl extends CompanyDatasource {
  final RestClient client;
  CompanyDatasourceImpl({
    required this.client,
  });

  @override
  Future<RestClientResponse> getCompanies() async {
    try {
      final baseResponse = await client.request(RestClientRequest(
        path: Api.companies.base,
        method: RestMethod.get,
        baseUrl: Api.base,
      ));
      return baseResponse;
    } on BaseException catch (_) {
      rethrow;
    } catch (e) {
      log(e.toString(), name: 'CompanyDatasourceImpl - getCompanies');
      rethrow;
    }
  }
}
