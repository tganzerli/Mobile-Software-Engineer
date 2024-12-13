import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_software_engineer/ui/ui.dart';

class LineTextFieldComp extends StatelessWidget {
  final String? label;
  final Color? textColor;
  final bool isEnabled;
  final Icon? prefixIcon;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final TextCapitalization? textCapitalization;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final void Function()? onTap;
  final void Function(PointerDownEvent)? onTapOutside;
  const LineTextFieldComp({
    super.key,
    this.label,
    this.textColor,
    required this.isEnabled,
    this.prefixIcon,
    this.controller,
    this.focusNode,
    this.keyboardType,
    this.textCapitalization,
    this.inputFormatters,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.onTapOutside,
  });

  @override
  Widget build(BuildContext context) {
    final colors = UiColors.of(context);
    final spacing = UiSpacing.of(context);
    final textTheme = Theme.of(context).textTheme;
    return SizedBox(
      height: spacing.size(40),
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        keyboardType: keyboardType,
        textCapitalization: textCapitalization ?? TextCapitalization.none,
        enabled: isEnabled,
        textAlignVertical: TextAlignVertical.center,
        maxLines: 1,
        onChanged: onChanged,
        onFieldSubmitted: onSubmitted,
        onTapOutside: onTapOutside,
        onTap: onTap,
        readOnly: !isEnabled || onTap != null,
        style: textTheme.titleMedium!
            .copyWith(color: textColor ?? colors.black900),
        inputFormatters: inputFormatters,
        cursorColor: colors.gray700,
        cursorWidth: spacing.size(1.5),
        cursorHeight: spacing.spacingMD,
        decoration: InputDecoration(
          hintText: label,
          hintStyle: textTheme.titleMedium!.copyWith(
            color: colors.gray500,
          ),
          filled: true,
          fillColor: colors.gray200,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(spacing.spacingXXS),
            borderSide: BorderSide(
              color: colors.gray200,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(spacing.spacingXXS),
            borderSide: BorderSide(
              color: colors.gray200,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(spacing.spacingXXS),
            borderSide: BorderSide(
              color: colors.gray400,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(spacing.spacingXXS),
            borderSide: BorderSide(
              color: colors.gray200,
            ),
          ),
          prefixIcon: prefixIcon,
          prefixIconColor: colors.gray500,
          contentPadding: EdgeInsets.symmetric(
            vertical: spacing.spacingXS,
            horizontal: spacing.spacingLG,
          ),
        ),
      ),
    );
  }
}
