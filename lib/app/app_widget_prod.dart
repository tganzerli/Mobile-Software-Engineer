import 'package:flutter/material.dart';

import '../ui/ui.dart';
import 'start_config_prod.dart';
import 'view/menu/menu_page.dart';
import 'view/splash/splash_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: StartConfig.instance,
      theme: lightTheme(context),
      routes: {
        '/': (context) => const SplashPage(),
        '/menu': (context) => const MenuPage(),
      },
    );
  }
}
