import 'package:flutter/material.dart';

import 'package:mobile_software_engineer/core/core.dart';
import 'package:mobile_software_engineer/ui/ui.dart';

class TreeElementWidget extends StatelessWidget {
  final TreeElementEntity element;
  const TreeElementWidget({
    super.key,
    required this.element,
  });

  @override
  Widget build(BuildContext context) {
    final spacing = UiSpacing.of(context);
    final colors = UiColors.of(context);
    final text = Theme.of(context).textTheme;
    return CollapseBox(
      startExpeand: false,
      title: (width) {
        return SizedBox(
          child: Row(
            children: [
              switch (element.type) {
                Type.location => UiImages.location(),
                Type.component => UiImages.component(),
                Type.asset => UiImages.asset(),
              },
              SizedBox(
                width: spacing.spacingXS,
              ),
              Container(
                constraints: BoxConstraints(maxWidth: width - spacing.size(40)),
                child: Text(
                  element.name,
                  style: text.bodyLarge,
                ),
              ),
              SizedBox(
                width: element.type == Type.component ? spacing.spacingXS : 0,
              ),
              element.type == Type.component
                  ? switch (element.componentsStatus!) {
                      ComponentsStatus.operating => UiIcons.bolt(
                          color: colors.greenDefault,
                        ),
                      ComponentsStatus.alert => Container(
                          width: spacing.size(8),
                          height: spacing.size(8),
                          decoration: BoxDecoration(
                              color: colors.redDefault, shape: BoxShape.circle),
                        ),
                    }
                  : const SizedBox(),
            ],
          ),
        );
      },
      body: element.children.isEmpty
          ? null
          : Column(
              children: element.children
                  .map((child) => TreeElementWidget(
                        element: child,
                      ))
                  .toList(),
            ),
    );
  }
}
