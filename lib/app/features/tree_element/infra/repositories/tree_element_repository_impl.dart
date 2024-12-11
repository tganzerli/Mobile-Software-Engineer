import 'dart:developer';

import 'package:mobile_software_engineer/core/core.dart';

import '../../domain/repositories/tree_element_repository.dart';
import '../adapters/tree_element_adapter.dart';
import '../datasources/tree_element_datasource.dart';

class TreeElementRepositoryImpl extends TreeElementRepository {
  final TreeElementDatasource treeElementDatasource;
  TreeElementRepositoryImpl({
    required this.treeElementDatasource,
  });

  @override
  Future<Output<List<TreeElementEntity>>> getElements(
      {required CompaniesEntity company}) async {
    try {
      List<TreeElementEntity> elementsList = [];

      final locationsResponse =
          await treeElementDatasource.getLocations(companyId: company.id);
      elementsList.addAll((locationsResponse.data as List)
          .map((locationMap) => ElementsAdapter.fromLocationsMap(locationMap)));

      final assetsResponse =
          await treeElementDatasource.getAssets(companyId: company.id);
      elementsList.addAll((assetsResponse.data as List)
          .map((assetsMap) => ElementsAdapter.fromAssetsMap(assetsMap)));

      Map<String, TreeElementEntity> elementsMap = {
        for (var entity in elementsList) entity.id: entity,
      };

      List<TreeElementEntity> roots = [];

      for (var entity in elementsList) {
        if (entity.parentId == null) {
          roots.add(entity);
        } else {
          final parent = elementsMap[entity.parentId];
          if (parent != null) {
            parent.children = [...parent.children, entity];
          }
        }
      }

      return right(roots);
    } on BaseException catch (e) {
      return left(e);
    } catch (e) {
      log(e.toString(), name: 'TreeElementRepositoryImpl');
      rethrow;
    }
  }
}
