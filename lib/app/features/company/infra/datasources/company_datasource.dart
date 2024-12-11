import 'package:mobile_software_engineer/core/core.dart';

abstract class CompanyDatasource {
  Future<RestClientResponse> getCompanies();
}
