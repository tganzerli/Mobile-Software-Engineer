import 'package:auto_injector/auto_injector.dart';
import 'package:mobile_software_engineer/core/core.dart';

import 'domain/repositories/company_repository.dart';
import 'domain/usecases/get_companies_usecase.dart';
import 'external/datasources/company_datasource_impl.dart';
import 'infra/datasources/company_datasource.dart';
import 'infra/repositories/company_repository_impl.dart';

final companyFeature = AutoInjector(
  tag: 'companyFeature',
  on: (i) {
    i.addInjector(coreModule);
    i.add<CompanyDatasource>(CompanyDatasourceImpl.new);
    i.add<CompanyRepository>(CompanyRepositoryImpl.new);
    i.add<GetCompaniesUsecase>(GetCompaniesUsecaseImpl.new);
  },
);
