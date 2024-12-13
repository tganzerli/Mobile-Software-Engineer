import 'package:flutter/material.dart';
import 'package:mobile_software_engineer/injector.dart';
import 'package:mobile_software_engineer/ui/ui.dart';

import 'menu_view_model.dart';
import 'menu_states.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  final controller = injector.get<MenuViewModels>();

  void listener() {
    MenuState state = controller.state;
    if (state is MenuError) {
      Future.delayed(const Duration(seconds: 3), () {
        controller.initEvent();
      });
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
    final colors = UiColors.of(context);
    final spacing = UiSpacing.of(context);

    return Scaffold(
      backgroundColor: colors.white50,
      appBar: AppBar(
        backgroundColor: colors.secondary,
        title: UiLogos.tractian(),
      ),
      body: ValueListenableBuilder(
          valueListenable: controller,
          builder: (context, state, __) {
            return SafeArea(
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: spacing.marginApp, vertical: spacing.spacingXL),
                child: ListView.separated(
                    itemCount: state.companies.length,
                    separatorBuilder: (context, index) => SizedBox(
                          height: spacing.spacingXL,
                        ),
                    itemBuilder: (context, index) {
                      return ButtonUiComp(
                        label: state.companies[index].name,
                        height: spacing.size(76),
                        prefixIcon: UiIcons.vector(),
                        onPressed: () {},
                      );
                    }),
              ),
            );
          }),
    );
  }
}
