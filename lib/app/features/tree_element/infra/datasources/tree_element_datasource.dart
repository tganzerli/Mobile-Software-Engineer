import 'package:mobile_software_engineer/core/core.dart';

abstract class TreeElementDatasource {
  Future<RestClientResponse> getLocations({required String companyId});
  Future<RestClientResponse> getAssets({required String companyId});
}
