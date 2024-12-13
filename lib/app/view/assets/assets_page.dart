import 'package:flutter/material.dart';

import 'package:mobile_software_engineer/core/core.dart';
import 'package:mobile_software_engineer/injector.dart';
import 'package:mobile_software_engineer/ui/ui.dart';

import 'assets_constants.dart';
import 'assets_states.dart';
import 'assets_view_model.dart';

class AssetsPage extends StatefulWidget {
  const AssetsPage({super.key});

  @override
  State<AssetsPage> createState() => _AssetsPageState();
}

class _AssetsPageState extends State<AssetsPage> {
  final controller = injector.get<AssetsViewModels>();

  late CompaniesEntity company;

  void listener() {
    AssetsState state = controller.state;
    if (state is AssetsError) {
      Future.delayed(const Duration(seconds: 5), () {
        controller.initEvent(company: company);
      });
    }
  }

  @override
  void initState() {
    super.initState();
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
    company = (ModalRoute.of(context)?.settings.arguments) as CompaniesEntity;
    controller.initEvent(company: company);
  }

  @override
  Widget build(BuildContext context) {
    final colors = UiColors.of(context);
    final spacing = UiSpacing.of(context);
    final text = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: colors.white50,
      appBar: AppBar(
        backgroundColor: colors.secondary,
        leading: BackButton(
          color: colors.white50,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          AssetsTextConstants.title,
          style: text.titleLarge!.copyWith(color: colors.white50),
        ),
      ),
      body: ValueListenableBuilder(
          valueListenable: controller,
          builder: (context, state, __) {
            return SafeArea(
              child: Container(
                padding: EdgeInsets.all(spacing.marginApp),
              ),
            );
          }),
    );
  }
}
