import 'package:flutter/material.dart';
import 'package:mobile_software_engineer/injector.dart';
import 'package:mobile_software_engineer/ui/ui.dart';

import 'splash_view_model.dart';
import 'splash_states.dart';
import 'widget/internet_block_widget.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final controller = injector.get<SplashViewModels>();

  void listener() {
    SplashState state = controller.state;
    if (state is SplashInternetBlock) {
      InternetBlockSplashWidget(
        context,
        retryFunc: controller.initEvent,
      );
    }
    if (state is SplashSuccess) {
      Navigator.popAndPushNamed(context, '/menu');
    }
  }

  @override
  void initState() {
    super.initState();
    controller.initEvent();
    controller.addListener(listener);
  }

  @override
  void dispose() {
    controller.removeListener(listener);
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final colors = UiColors.of(context);

    return Container(
      height: size.height,
      width: size.width,
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [colors.primary, colors.secondary],
      )),
    );
  }
}
