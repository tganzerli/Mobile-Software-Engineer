import 'package:auto_injector/auto_injector.dart';

export 'controllers/controllers.dart';
export 'errors/errors.dart';
export 'services/services.dart';
export 'types/types.dart';

final coreModule = AutoInjector(
  tag: 'coreModule',
  on: (injector) {},
);
