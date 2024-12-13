part of 'button.dart';

enum ButtonType {
  primary();

  Color getBackgroundColor(BuildContext context) {
    final colors = UiColors.of(context);
    return switch (this) {
      ButtonType.primary => colors.primary,
    };
  }

  Color getBorderColor(BuildContext context) {
    final colors = UiColors.of(context);
    return switch (this) {
      ButtonType.primary => colors.primary,
    };
  }

  Color getDisabledColor(BuildContext context) {
    final colors = UiColors.of(context);
    return switch (this) {
      ButtonType.primary => colors.gray400,
    };
  }

  Color getDisabledBorderColor(BuildContext context) {
    final colors = UiColors.of(context);
    return switch (this) {
      ButtonType.primary => colors.gray400,
    };
  }

  Color getTextColor(BuildContext context) {
    final colors = UiColors.of(context);
    return switch (this) {
      ButtonType.primary => colors.white50,
    };
  }

  Color getDisabledTextColor(BuildContext context) {
    final colors = UiColors.of(context);
    return switch (this) {
      ButtonType.primary => colors.white50,
    };
  }
}
