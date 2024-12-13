import 'package:mobile_software_engineer/app/features/company/domain/usecases/get_companies_usecase.dart';
import 'package:mobile_software_engineer/core/core.dart';

import 'menu_states.dart';

class MenuViewModels extends ViewModel<MenuState> {
  final GetCompaniesUsecase getCompaniesUsecase;
  MenuViewModels({
    required this.getCompaniesUsecase,
  }) : super(MenuInitial());

  Future<void> initEvent() async {
    emit(state.loading());
    final getCompanies = await getCompaniesUsecase();

    getCompanies.fold(
      (exception) {
        emit(state.error(message: exception.message));
      },
      (companies) {
        emit(state.success(companies: companies));
      },
    );
  }
}
