import 'package:auto_injector/auto_injector.dart';

export 'components/components.dart';
export 'elements/elements.dart';
export 'themes/theme.dart';

final uiModule = AutoInjector(
  tag: 'uiModule',
  on: (injector) {},
);
