import 'package:auto_injector/auto_injector.dart';

import 'core/core.dart';
import 'ui/ui.dart';

final injector = AutoInjector(on: (injector) {
  injector.addInjector(coreModule);
  injector.addInjector(uiModule);

  injector.commit();
});
