import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_software_engineer/app/app_url.dart';
import 'package:mobile_software_engineer/app/features/company/domain/repositories/company_repository.dart';
import 'package:mobile_software_engineer/app/features/company/infra/datasources/company_datasource.dart';
import 'package:mobile_software_engineer/app/features/company/infra/repositories/company_repository_impl.dart';
import 'package:mobile_software_engineer/core/core.dart';
import 'package:mocktail/mocktail.dart';

import 'mocks.dart';

class MockCompanyDatasource extends Mock implements CompanyDatasource {}

void main() {
  final CompanyMocks mock = CompanyMocks();
  late CompanyDatasource companyDatasource;
  late CompanyRepository companyRepository;

  setUp(() {
    companyDatasource = MockCompanyDatasource();
    companyRepository = CompanyRepositoryImpl(
      companyDatasource: companyDatasource,
    );
  });

  group('[CompanyRepository] getCompanies function: ', () {
    test('Get Companies successfully from API', () async {
      when(() => companyDatasource.getCompanies()).thenAnswer(
        (_) async => RestClientResponse(
          request: RestClientRequest(
            path: Api.companies.base,
            method: RestMethod.get,
            baseUrl: Api.base,
          ),
          statusCode: 200,
          data: mock.companies,
        ),
      );

      final getResponse = await companyRepository.getCompanies();
      expect(getResponse.isRight, true);

      late List<CompaniesEntity> companiesReturn;
      getResponse.fold((l) => null, (r) => companiesReturn = r);

      expect(companiesReturn.first, isA<CompaniesEntity>());
      expect(companiesReturn.first.id, '662fd0ee639069143a8fc387');
    });
    test('Error from API', () async {
      when(() => companyDatasource.getCompanies()).thenThrow(
          RestClientException(message: 'Error', statusCode: 500, error: null));

      final getResponse = await companyRepository.getCompanies();
      expect(getResponse.isRight, false);

      late BaseException exception;
      getResponse.fold((l) => exception = l, (r) => null);
      expect(exception, isA<RestClientException>());
    });
  });
}
