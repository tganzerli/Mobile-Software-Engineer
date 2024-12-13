import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:mobile_software_engineer/ui/ui.dart';

class CollapseBox extends StatefulWidget {
  final Widget Function(double width) title;
  final Widget? body;
  final bool startExpeand;
  final void Function(bool expeand)? expeandCalback;
  const CollapseBox({
    super.key,
    required this.title,
    this.body,
    required this.startExpeand,
    this.expeandCalback,
  });

  @override
  State<CollapseBox> createState() => _CollapseBoxState();
}

class _CollapseBoxState extends State<CollapseBox>
    with SingleTickerProviderStateMixin<CollapseBox> {
  final Duration animationTime = const Duration(microseconds: 500);
  late AnimationController _controllerAnim;
  late Animation _iconRotate;
  late bool expeand;

  void _animation(bool expeand) {
    if (expeand) {
      _controllerAnim.forward();
    } else {
      _controllerAnim.reverse();
    }
  }

  @override
  void initState() {
    expeand = widget.startExpeand;
    _controllerAnim = AnimationController(
      vsync: this,
      duration: animationTime,
    );
    _iconRotate = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(
        parent: _controllerAnim,
        curve: const Interval(1, 0, curve: Curves.linear),
      ),
    );
    _animation(expeand);
    _controllerAnim.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void didUpdateWidget(covariant CollapseBox oldWidget) {
    setState(() {
      expeand = widget.startExpeand;
    });
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _controllerAnim.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.body != null) {
      return AnimatedContainer(
        duration: animationTime,
        curve: Curves.linear,
        child: expeand ? _expandedChild(context) : _title(context),
      );
    }

    return _title(context);
  }

  Widget _title(BuildContext context) {
    final spacing = UiSpacing.of(context);
    return Column(
      children: [
        GestureDetector(
          onTap: widget.body == null
              ? null
              : () {
                  expeand = !expeand;
                  _animation(expeand);
                  if (widget.expeandCalback != null) {
                    widget.expeandCalback!(expeand);
                  }
                },
          child: Container(
            alignment: Alignment.center,
            color: Colors.transparent,
            height: spacing.size(30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                widget.body == null
                    ? SizedBox(
                        width: spacing.spacingXL,
                      )
                    : SizedBox(
                        width: spacing.spacingXL,
                        child: Transform.rotate(
                            angle: _iconRotate.value * math.pi,
                            child: Icon(Icons.keyboard_arrow_down_outlined)),
                      ),
                Flexible(
                  fit: FlexFit.loose,
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return SizedBox(
                        width: constraints.maxWidth,
                        child: widget.title(constraints.maxWidth),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: spacing.marginApp,
        ),
      ],
    );
  }

  Widget _expandedChild(BuildContext context) {
    final spacing = UiSpacing.of(context);
    return Column(
      children: [
        _title(context),
        Padding(
          padding: EdgeInsets.only(left: spacing.spacingMD),
          child: widget.body!,
        ),
      ],
    );
  }
}
