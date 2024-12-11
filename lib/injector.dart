import 'package:auto_injector/auto_injector.dart';

import 'app/features/company/company.dart';
import 'app/features/tree_element/tree_element.dart';
import 'core/core.dart';
import 'ui/ui.dart';

final injector = AutoInjector(on: (i) {
  i.addInjector(coreModule);
  i.addInjector(uiModule);

  // Features
  i.addInjector(companyFeature);
  i.addInjector(treeElementFeature);

  i.commit();
});
