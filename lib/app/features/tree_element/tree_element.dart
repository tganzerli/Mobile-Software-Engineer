import 'package:auto_injector/auto_injector.dart';

import 'domain/repositories/tree_element_repository.dart';
import 'domain/usecases/get_elements_usecase.dart';
import 'external/datasources/tree_element_datasource_impl.dart';
import 'infra/datasources/tree_element_datasource.dart';
import 'infra/repositories/tree_element_repository_impl.dart';

final treeElementFeature = AutoInjector(
  tag: 'treeElementFeature',
  on: (i) {
    i.add<TreeElementDatasource>(TreeElementDatasourceImpl.new);
    i.add<TreeElementRepository>(TreeElementRepositoryImpl.new);
    i.add<GetTreeElementsUsecase>(GetTreeElementsUsecaseImpl.new);
  },
);
