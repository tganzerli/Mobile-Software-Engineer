import 'dart:developer';

import 'package:mobile_software_engineer/core/core.dart';

import '../../domain/repositories/company_repository.dart';
import '../adapters/companies_adapter.dart';
import '../datasources/company_datasource.dart';

class CompanyRepositoryImpl extends CompanyRepository {
  final CompanyDatasource companyDatasource;
  CompanyRepositoryImpl({
    required this.companyDatasource,
  });

  @override
  Future<Output<List<CompaniesEntity>>> getCompanies() async {
    try {
      final getResponse = await companyDatasource.getCompanies();

      final List<CompaniesEntity> companies = (getResponse.data as List)
          .map((mapCompany) => CompaniesAdapter.fromMap(mapCompany))
          .toList();

      return right(companies);
    } on BaseException catch (e) {
      return left(e);
    } catch (e) {
      log(e.toString(), name: 'ProfessionsRepositoryImpl');
      rethrow;
    }
  }
}
