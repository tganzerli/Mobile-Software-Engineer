import 'package:auto_injector/auto_injector.dart';
import 'package:mobile_software_engineer/core/core.dart';

import 'domain/repositories/check_internet.dart';
import 'domain/usecases/check_internet_usecase.dart';
import 'external/datasources/check_internet_datasource_impl.dart';
import 'infra/datasources/check_internet_datasource.dart';
import 'infra/repositories/check_internet_repository_impl.dart';

final checkInternetFeature = AutoInjector(
  tag: 'checkInternetFeature',
  on: (i) {
    i.addInjector(coreModule);
    i.add<CheckInternetDataSource>(CheckInternetDataSourceImpl.new);
    i.add<CheckInternetRepository>(CheckInternetRepositoryImpl.new);
    i.add<CheckInternetUseCase>(CheckInternetUseCaseImpl.new);
  },
);
