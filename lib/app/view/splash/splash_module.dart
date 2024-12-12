import 'package:auto_injector/auto_injector.dart';

import 'splash_view_model.dart';

final splashModule = AutoInjector(
  tag: 'splashModule',
  on: (i) {
    i.addSingleton<SplashViewModels>(SplashViewModels.new);
  },
);
