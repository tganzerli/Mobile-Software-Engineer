import 'package:mobile_software_engineer/app/features/tree_element/domain/usecases/get_elements_usecase.dart';
import 'package:mobile_software_engineer/core/core.dart';

import 'assets_states.dart';

class AssetsViewModels extends ViewModel<AssetsState> {
  final GetTreeElementsUsecase getTreeElementsUsecase;
  AssetsViewModels({
    required this.getTreeElementsUsecase,
  }) : super(AssetsInitial());

  Future<void> initEvent({required CompaniesEntity company}) async {
    emit(state.loading());
    final getElements = await getTreeElementsUsecase(company: company);

    getElements.fold(
      (exception) {
        emit(state.error(message: exception.message));
      },
      (elementsRoots) {
        emit(state.success(
            elementsRoots: elementsRoots, elementsFiltered: elementsRoots));
      },
    );
  }
}
