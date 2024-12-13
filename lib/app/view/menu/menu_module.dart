import 'package:auto_injector/auto_injector.dart';
import 'package:mobile_software_engineer/app/features/company/company.dart';

import 'menu_view_model.dart';

final menuhModule = AutoInjector(
  tag: 'menuhModule',
  on: (i) {
    i.addInjector(companyFeature);
    i.addSingleton<MenuViewModels>(MenuViewModels.new);
  },
);
