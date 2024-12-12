import 'package:flutter/material.dart';
import 'package:mobile_software_engineer/core/core.dart';
import 'package:mobile_software_engineer/injector.dart';

import '../ui/ui.dart';

class StartConfig extends StatefulWidget {
  final Widget? child;

  const StartConfig({super.key, this.child});

  static StartConfig instance(BuildContext context, Widget? child) {
    return StartConfig(child: child);
  }

  @override
  State<StartConfig> createState() => _StartConfigState();
}

class _StartConfigState extends State<StartConfig> {
  final client = injector.get<RestClient>();

  Future<void> addInterceptors() async {
    client.addInterceptors(LogsInterceptor());
  }

  @override
  void initState() {
    super.initState();
    addInterceptors();
  }

  @override
  Widget build(BuildContext context) {
    final colors = UiColors.of(context);
    return widget.child ??
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [colors.primary, colors.secondary],
          )),
        );
  }
}
