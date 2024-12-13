import 'package:flutter/material.dart';

import 'package:mobile_software_engineer/core/core.dart';
import 'package:mobile_software_engineer/ui/ui.dart';

class TreeElementWidget extends StatefulWidget {
  final TreeElementEntity element;
  final bool startExpeand;
  const TreeElementWidget({
    super.key,
    required this.element,
    this.startExpeand = false,
  });

  @override
  State<TreeElementWidget> createState() => _TreeElementWidgetState();
}

class _TreeElementWidgetState extends State<TreeElementWidget> {
  late bool startExpeand;

  @override
  void initState() {
    startExpeand = widget.startExpeand;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant TreeElementWidget oldWidget) {
    if (widget.startExpeand != oldWidget.startExpeand) {
      startExpeand = widget.startExpeand;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    final spacing = UiSpacing.of(context);
    final colors = UiColors.of(context);
    final text = Theme.of(context).textTheme;
    return CollapseBox(
      startExpeand: startExpeand,
      title: (width) {
        return SizedBox(
          child: Row(
            children: [
              switch (widget.element.type) {
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
                  widget.element.name,
                  style: text.bodyLarge,
                ),
              ),
              SizedBox(
                width: widget.element.type == Type.component
                    ? spacing.spacingXS
                    : 0,
              ),
              widget.element.type == Type.component
                  ? switch (widget.element.componentsStatus!) {
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
      body: widget.element.children.isEmpty
          ? null
          : Column(
              children: widget.element.children
                  .map((child) => TreeElementWidget(
                        element: child,
                        startExpeand: startExpeand,
                      ))
                  .toList(),
            ),
    );
  }
}
