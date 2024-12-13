import 'package:flutter/widgets.dart';
import 'package:mobile_software_engineer/app/features/tree_element/domain/usecases/get_elements_usecase.dart';
import 'package:mobile_software_engineer/core/core.dart';

import 'assets_states.dart';

class AssetsViewModels extends ViewModel<AssetsState> {
  final GetTreeElementsUsecase getTreeElementsUsecase;
  AssetsViewModels({
    required this.getTreeElementsUsecase,
  }) : super(AssetsInitial());

  TextEditingController textController = TextEditingController();
  FocusNode focusNode = FocusNode();

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

  Future<void> filterEvent(
      {ValueGetter<ComponentsStatus?>? componentsStatus}) async {
    final status = componentsStatus == null ? null : componentsStatus();
    if (status == null) {
      emit(state.success(
          elementsFiltered: filterName(), componentsStatus: componentsStatus));
    } else {
      final filtered = filterName()
          .map((element) => element.filterStatus(status))
          .whereType<TreeElementEntity>()
          .toList();

      emit(state.success(
          elementsFiltered: filtered, componentsStatus: componentsStatus));
    }
  }

  List<TreeElementEntity> filterName() {
    if (textController.text.isEmpty) {
      return state.elementsRoots;
    } else {
      return state.elementsRoots
          .map((element) => element.filterName(textController.text))
          .whereType<TreeElementEntity>()
          .toList();
    }
  }
}
