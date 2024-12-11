import 'dart:developer';

import 'package:mobile_software_engineer/app/app_url.dart';
import 'package:mobile_software_engineer/core/core.dart';

import '../../infra/datasources/tree_element_datasource.dart';

class TreeElementDatasourceImpl extends TreeElementDatasource {
  final RestClient client;
  TreeElementDatasourceImpl({
    required this.client,
  });

  @override
  Future<RestClientResponse> getAssets({required String companyId}) async {
    try {
      final baseResponse = await client.request(RestClientRequest(
        path: Api.companies.assets(companyId),
        method: RestMethod.get,
        baseUrl: Api.base,
      ));
      return baseResponse;
    } on BaseException catch (_) {
      rethrow;
    } catch (e) {
      log(e.toString(), name: 'TreeElementDatasourceImpl - getAssets');
      rethrow;
    }
  }

  @override
  Future<RestClientResponse> getLocations({required String companyId}) async {
    try {
      final baseResponse = await client.request(RestClientRequest(
        path: Api.companies.locations(companyId),
        method: RestMethod.get,
        baseUrl: Api.base,
      ));
      return baseResponse;
    } on BaseException catch (_) {
      rethrow;
    } catch (e) {
      log(e.toString(), name: 'TreeElementDatasourceImpl - getLocations');
      rethrow;
    }
  }
}
