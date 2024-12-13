part of 'button.dart';

enum ButtonType {
  primary(),
  light();

  Color getBackgroundColor(BuildContext context) {
    final colors = UiColors.of(context);
    return switch (this) {
      ButtonType.primary => colors.primary,
      ButtonType.light => Colors.transparent,
    };
  }

  Color getBorderColor(BuildContext context) {
    final colors = UiColors.of(context);
    return switch (this) {
      ButtonType.primary => colors.primary,
      ButtonType.light => colors.gray400,
    };
  }

  Color getDisabledColor(BuildContext context) {
    final colors = UiColors.of(context);
    return switch (this) {
      ButtonType.primary => colors.gray400,
      ButtonType.light => Colors.transparent,
    };
  }

  Color getDisabledBorderColor(BuildContext context) {
    final colors = UiColors.of(context);
    return switch (this) {
      ButtonType.primary => colors.gray400,
      ButtonType.light => colors.gray400,
    };
  }

  Color getTextColor(BuildContext context) {
    final colors = UiColors.of(context);
    return switch (this) {
      ButtonType.primary => colors.white50,
      ButtonType.light => colors.gray700,
    };
  }

  Color getDisabledTextColor(BuildContext context) {
    final colors = UiColors.of(context);
    return switch (this) {
      ButtonType.primary => colors.white50,
      ButtonType.light => colors.gray400,
    };
  }
}
