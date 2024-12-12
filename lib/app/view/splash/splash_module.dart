import 'package:auto_injector/auto_injector.dart';
import 'package:mobile_software_engineer/app/features/check_internet/check_internet.dart';

import 'splash_view_model.dart';

final splashModule = AutoInjector(
  tag: 'splashModule',
  on: (i) {
    i.addInjector(checkInternetFeature);
    i.addSingleton<SplashViewModels>(SplashViewModels.new);
  },
);
