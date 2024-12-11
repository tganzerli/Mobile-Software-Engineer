import 'package:auto_injector/auto_injector.dart';
import 'package:dio/dio.dart';

import 'core.dart';
import 'services/client/dio/dio_impl.dart';

export 'controllers/controllers.dart';
export 'errors/errors.dart';
export 'services/services.dart';
export 'types/types.dart';

final coreModule = AutoInjector(
  tag: 'coreModule',
  on: (i) {
    i.add<Dio>(DioFactory.dio);
    i.addSingleton<RestClient>(RestClientDioImpl.new);
  },
);
