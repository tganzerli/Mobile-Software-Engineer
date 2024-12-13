import 'package:auto_injector/auto_injector.dart';

import 'app/features/check_internet/check_internet.dart';
import 'app/features/company/company.dart';
import 'app/features/tree_element/tree_element.dart';
import 'app/view/assets/assets_module.dart';
import 'app/view/menu/menu_module.dart';
import 'app/view/splash/splash_module.dart';
import 'core/core.dart';
import 'ui/ui.dart';

final injector = AutoInjector(on: (i) {
  i.addInjector(coreModule);
  i.addInjector(uiModule);

  // Features
  i.addInjector(checkInternetFeature);
  i.addInjector(companyFeature);
  i.addInjector(treeElementFeature);

  //views
  i.addInjector(splashModule);
  i.addInjector(menuhModule);
  i.addInjector(assetsModule);

  i.commit();
});
