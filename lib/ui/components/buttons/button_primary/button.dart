import 'package:flutter/material.dart';
import 'package:mobile_software_engineer/ui/ui.dart';

part 'button_types.dart';

/// A customizable button component with various styles and icon options.
///
/// The [ButtonUiComp] allows you to create buttons with different styles,
/// defined by [ButtonType], and optional icons defined by [UiIcons].
class ButtonUiComp extends StatelessWidget {
  /// The text label of the button.
  final String label;

  /// The callback function to be executed when the button is pressed.
  /// If null, the button will be disabled.
  final VoidCallback? onPressed;

  /// An optional icon to be displayed at the beginning of the button.
  final UiIcons? prefixIcon;

  /// An optional icon to be displayed at the end of the button.
  final UiIcons? suffixIcon;

  /// The width of the button. If null, it will default to fit the content.
  final double? width;

  /// The height of the button. If null, it will default to a standard size.
  final double? height;

  /// The padding of the button. If null, it will default to a standard size.
  final EdgeInsetsGeometry? padding;

  /// Space between icon and label. If null, it will default to a standard size.
  final double? iconSpacing;

  /// The type of the button which defines its style.
  /// If null, it defaults to [ButtonType.primary].
  final ButtonType? buttonType;

  /// Creates a [ButtonUiComp] with the given properties.
  ///
  /// The [label] is required and defines the text shown on the button.
  /// The [onPressed] is required and defines the callback function to be executed when the button is pressed.
  const ButtonUiComp({
    required this.label,
    this.onPressed,
    this.buttonType,
    this.prefixIcon,
    this.suffixIcon,
    this.width,
    this.height,
    this.padding,
    this.iconSpacing,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final spacing = UiSpacing.of(context);

    final textTheme = Theme.of(context).textTheme;

    final ButtonType effectiveButtonType = buttonType ?? ButtonType.primary;

    final backgroundColor = onPressed == null
        ? effectiveButtonType.getDisabledColor(context)
        : effectiveButtonType.getBackgroundColor(context);
    final textColor = onPressed == null
        ? effectiveButtonType.getDisabledTextColor(context)
        : effectiveButtonType.getTextColor(context);
    final borderColor = onPressed == null
        ? effectiveButtonType.getDisabledBorderColor(context)
        : effectiveButtonType.getBorderColor(context);

    return Container(
      width: width,
      height: height ?? spacing.size(50),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(spacing.spacingXXS),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          elevation: 0,
          padding:
              padding ?? EdgeInsets.symmetric(horizontal: spacing.spacingXL),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(spacing.spacingXXS),
            side: BorderSide(color: borderColor),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            prefixIcon ?? const SizedBox(),
            SizedBox(
                width:
                    prefixIcon == null ? 0 : iconSpacing ?? spacing.spacingMD),
            Text(
              label,
              style: textTheme.titleMedium!.copyWith(
                color: textColor,
              ),
            ),
            SizedBox(
                width:
                    prefixIcon == null ? 0 : iconSpacing ?? spacing.spacingMD),
            suffixIcon ?? const SizedBox()
          ],
        ),
      ),
    );
  }
}
