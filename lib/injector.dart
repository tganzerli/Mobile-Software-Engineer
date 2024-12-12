import 'package:auto_injector/auto_injector.dart';

import 'app/features/company/company.dart';
import 'app/features/tree_element/tree_element.dart';
import 'app/view/splash/splash_module.dart';
import 'core/core.dart';
import 'ui/ui.dart';

final injector = AutoInjector(on: (i) {
  i.addInjector(coreModule);
  i.addInjector(uiModule);

  // Features
  i.addInjector(companyFeature);
  i.addInjector(treeElementFeature);

  //views
  i.addInjector(splashModule);

  i.commit();
});
