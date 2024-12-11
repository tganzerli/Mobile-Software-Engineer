import 'package:mobile_software_engineer/core/core.dart';

abstract class CompanyRepository {
  Future<Output<List<CompaniesEntity>>> getCompanies();
}
