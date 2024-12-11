import 'package:auto_injector/auto_injector.dart';

export 'errors/errors.dart';

final coreModule = AutoInjector(
  tag: 'coreModule',
  on: (injector) {},
);
