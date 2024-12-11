import 'package:auto_injector/auto_injector.dart';

import 'app/features/company/company.dart';
import 'core/core.dart';
import 'ui/ui.dart';

final injector = AutoInjector(on: (i) {
  i.addInjector(coreModule);
  i.addInjector(uiModule);

  // Features
  i.addInjector(companyFeature);

  i.commit();
});
