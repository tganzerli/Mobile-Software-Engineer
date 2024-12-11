import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_software_engineer/app/app_url.dart';
import 'package:mobile_software_engineer/app/features/tree_element/domain/repositories/tree_element_repository.dart';
import 'package:mobile_software_engineer/app/features/tree_element/infra/datasources/tree_element_datasource.dart';
import 'package:mobile_software_engineer/app/features/tree_element/infra/repositories/tree_element_repository_impl.dart';
import 'package:mobile_software_engineer/core/core.dart';
import 'package:mocktail/mocktail.dart';

import 'mocks.dart';

class MockTreeElementDatasource extends Mock implements TreeElementDatasource {}

void main() {
  final TreeElementMocks mock = TreeElementMocks();
  late TreeElementDatasource treeElementDatasource;
  late TreeElementRepository treeElementRepository;

  final CompaniesEntity company =
      CompaniesEntity(id: '662fd0ee639069143a8fc387', name: 'Jaguar');

  setUp(() {
    treeElementDatasource = MockTreeElementDatasource();
    treeElementRepository = TreeElementRepositoryImpl(
      treeElementDatasource: treeElementDatasource,
    );
  });

  group('[TreeElementRepository] getElements function: ', () {
    test('Get Elements successfully from API', () async {
      when(() => treeElementDatasource.getLocations(
          companyId: '662fd0ee639069143a8fc387')).thenAnswer(
        (_) async => RestClientResponse(
          request: RestClientRequest(
            path: Api.companies.locations('662fd0ee639069143a8fc387'),
            method: RestMethod.get,
            baseUrl: Api.base,
          ),
          statusCode: 200,
          data: mock.locations,
        ),
      );
      when(() => treeElementDatasource.getAssets(
          companyId: '662fd0ee639069143a8fc387')).thenAnswer(
        (_) async => RestClientResponse(
          request: RestClientRequest(
            path: Api.companies.assets('662fd0ee639069143a8fc387'),
            method: RestMethod.get,
            baseUrl: Api.base,
          ),
          statusCode: 200,
          data: mock.assets,
        ),
      );

      final getResponse =
          await treeElementRepository.getElements(company: company);
      expect(getResponse.isRight, true);

      late List<TreeElementEntity> elementsReturn;
      getResponse.fold((l) => null, (r) => elementsReturn = r);

      expect(elementsReturn.length, 4);

      final TreeElementEntity machineryHouseLocarion = elementsReturn
          .where((element) => element.id == '656733b1664c41001e91d9ed')
          .first;

      expect(machineryHouseLocarion.children.length, 2);

      final TreeElementEntity motorsH12D = machineryHouseLocarion.children
          .where((element) => element.id == '656734968eb037001e474d5a')
          .first;

      expect(motorsH12D.children.length, 3);
    });
    test('Error from locations API', () async {
      when(() =>
          treeElementDatasource.getLocations(
              companyId: '662fd0ee639069143a8fc387')).thenThrow(
          RestClientException(message: 'Error', statusCode: 500, error: null));
      when(() => treeElementDatasource.getAssets(
          companyId: '662fd0ee639069143a8fc387')).thenAnswer(
        (_) async => RestClientResponse(
          request: RestClientRequest(
            path: Api.companies.assets('662fd0ee639069143a8fc387'),
            method: RestMethod.get,
            baseUrl: Api.base,
          ),
          statusCode: 200,
          data: mock.assets,
        ),
      );

      final getResponse =
          await treeElementRepository.getElements(company: company);
      expect(getResponse.isRight, false);

      late BaseException exception;
      getResponse.fold((l) => exception = l, (r) => null);
      expect(exception, isA<RestClientException>());
    });
    test('Error from assets API', () async {
      when(() => treeElementDatasource.getLocations(
          companyId: '662fd0ee639069143a8fc387')).thenAnswer(
        (_) async => RestClientResponse(
          request: RestClientRequest(
            path: Api.companies.locations('662fd0ee639069143a8fc387'),
            method: RestMethod.get,
            baseUrl: Api.base,
          ),
          statusCode: 200,
          data: mock.locations,
        ),
      );
      when(() =>
          treeElementDatasource.getAssets(
              companyId: '662fd0ee639069143a8fc387')).thenThrow(
          RestClientException(message: 'Error', statusCode: 500, error: null));

      final getResponse =
          await treeElementRepository.getElements(company: company);
      expect(getResponse.isRight, false);

      late BaseException exception;
      getResponse.fold((l) => exception = l, (r) => null);
      expect(exception, isA<RestClientException>());
    });
  });
}
