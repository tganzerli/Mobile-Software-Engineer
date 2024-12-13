import 'package:mobile_software_engineer/core/core.dart';

abstract class MenuState implements ViewState {
  final List<CompaniesEntity> companies;

  MenuState({
    required this.companies,
  });

  MenuLoading loading() {
    return MenuLoading(companies: companies);
  }

  MenuSuccess success({List<CompaniesEntity>? companies}) {
    return MenuSuccess(companies: companies ?? this.companies);
  }

  MenuError error({required String message}) {
    return MenuError(
      message: message,
      companies: companies,
    );
  }
}

final class MenuInitial extends MenuState {
  MenuInitial() : super(companies: []);
}

final class MenuLoading extends MenuState {
  MenuLoading({required super.companies});
}

final class MenuSuccess extends MenuState {
  MenuSuccess({required super.companies});
}

final class MenuError extends MenuState {
  final String message;
  MenuError({
    required this.message,
    required super.companies,
  });
}
