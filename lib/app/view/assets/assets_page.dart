import 'package:flutter/material.dart';

import 'package:mobile_software_engineer/core/core.dart';
import 'package:mobile_software_engineer/injector.dart';
import 'package:mobile_software_engineer/ui/ui.dart';

import 'assets_constants.dart';
import 'assets_states.dart';
import 'assets_view_model.dart';
import 'widget/tree_element_widget.dart';

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
    if (controller.state.elementsRoots.isEmpty) {
      controller.initEvent(company: company);
    }
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
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(spacing.size(124)),
          child: Container(
            width: double.maxFinite,
            height: spacing.size(124),
            decoration: BoxDecoration(
              color: colors.white50,
              border: Border(bottom: BorderSide(color: colors.gray300)),
            ),
            child: Padding(
                padding: EdgeInsets.all(spacing.marginApp),
                child: ValueListenableBuilder(
                    valueListenable: controller,
                    builder: (context, state, __) {
                      return Column(
                        children: [
                          LineTextFieldComp(
                            isEnabled: true,
                            controller: controller.textController,
                            focusNode: controller.focusNode,
                            label: AssetsTextConstants.textFieldLable,
                            prefixIcon: Icon(Icons.search),
                            onChanged: (p0) => controller.filterEvent(),
                            onTapOutside: (p0) {
                              controller.focusNode.unfocus();
                              controller.filterEvent();
                            },
                            onSubmitted: (p0) {
                              controller.focusNode.unfocus();
                              controller.filterEvent();
                            },
                          ),
                          SizedBox(
                            height: spacing.spacingXS,
                          ),
                          Row(
                            children: [
                              ButtonUiComp(
                                label: AssetsTextConstants.button1,
                                width: spacing.size(200),
                                height: spacing.size(40),
                                padding: EdgeInsets.symmetric(
                                    horizontal: spacing.spacingXS),
                                iconSpacing: spacing.spacingXXS,
                                prefixIcon: UiIcons.boltOut(
                                  color: state.componentsStatus ==
                                          ComponentsStatus.operating
                                      ? colors.white50
                                      : colors.gray700,
                                ),
                                buttonType: state.componentsStatus ==
                                        ComponentsStatus.operating
                                    ? ButtonType.primary
                                    : ButtonType.light,
                                onPressed: () => controller.filterEvent(
                                  componentsStatus: () =>
                                      state.componentsStatus !=
                                              ComponentsStatus.operating
                                          ? ComponentsStatus.operating
                                          : null,
                                ),
                              ),
                              SizedBox(
                                width: spacing.spacingXS,
                              ),
                              ButtonUiComp(
                                label: AssetsTextConstants.button2,
                                width: spacing.size(100),
                                height: spacing.size(40),
                                padding: EdgeInsets.symmetric(
                                    horizontal: spacing.spacingXS),
                                iconSpacing: spacing.spacingXXS,
                                prefixIcon: UiIcons.critical(
                                  color: state.componentsStatus ==
                                          ComponentsStatus.alert
                                      ? colors.white50
                                      : colors.gray700,
                                ),
                                buttonType: state.componentsStatus ==
                                        ComponentsStatus.alert
                                    ? ButtonType.primary
                                    : ButtonType.light,
                                onPressed: () => controller.filterEvent(
                                  componentsStatus: () =>
                                      state.componentsStatus !=
                                              ComponentsStatus.alert
                                          ? ComponentsStatus.alert
                                          : null,
                                ),
                              )
                            ],
                          )
                        ],
                      );
                    })),
          ),
        ),
      ),
      body: ValueListenableBuilder(
          valueListenable: controller,
          builder: (context, state, __) {
            if (state is AssetsLoading) {
              return SafeArea(
                  child: Container(
                width: double.maxFinite,
                height: double.maxFinite,
                alignment: Alignment.center,
                child: CircularProgressIndicator(
                  color: colors.secondary,
                ),
              ));
            }
            if (state is AssetsError) {
              return SafeArea(
                  child: Container(
                      width: double.maxFinite,
                      height: double.maxFinite,
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.warning_amber_rounded,
                            color: colors.secondary,
                            size: spacing.spacingXXXL,
                          ),
                          SizedBox(
                            height: spacing.spacingMD,
                          ),
                          Text(AssetsTextConstants.errorMessage,
                              style: text.titleMedium,
                              textAlign: TextAlign.center)
                        ],
                      )));
            }

            return SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.all(spacing.marginApp),
                  child: Column(
                    children:
                        List.generate(state.elementsFiltered.length, (index) {
                      return TreeElementWidget(
                        element: state.elementsFiltered[index],
                        startExpeand: state.componentsStatus != null ||
                            controller.textController.text.isNotEmpty,
                      );
                    }),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
