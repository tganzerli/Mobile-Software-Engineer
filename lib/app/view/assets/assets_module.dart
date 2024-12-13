import 'package:auto_injector/auto_injector.dart';
import 'package:mobile_software_engineer/app/features/tree_element/tree_element.dart';

import 'assets_view_model.dart';

final assetsModule = AutoInjector(
  tag: 'assetsModule',
  on: (i) {
    i.addInjector(treeElementFeature);
    i.addSingleton<AssetsViewModels>(AssetsViewModels.new);
  },
);
