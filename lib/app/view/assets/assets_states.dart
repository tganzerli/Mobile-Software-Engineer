import 'package:mobile_software_engineer/core/core.dart';

abstract class AssetsState implements ViewState {
  final List<TreeElementEntity> elementsRoots;
  final List<TreeElementEntity> elementsFiltered;
  AssetsState({
    required this.elementsRoots,
    required this.elementsFiltered,
  });

  AssetsLoading loading() {
    return AssetsLoading(
      elementsRoots: elementsRoots,
      elementsFiltered: elementsFiltered,
    );
  }

  AssetsSuccess success({
    List<TreeElementEntity>? elementsRoots,
    List<TreeElementEntity>? elementsFiltered,
  }) {
    return AssetsSuccess(
      elementsRoots: elementsRoots ?? this.elementsRoots,
      elementsFiltered: elementsFiltered ?? this.elementsFiltered,
    );
  }

  AssetsError error({required String message}) {
    return AssetsError(
      message: message,
      elementsRoots: elementsRoots,
      elementsFiltered: elementsFiltered,
    );
  }
}

final class AssetsInitial extends AssetsState {
  AssetsInitial() : super(elementsRoots: [], elementsFiltered: []);
}

final class AssetsLoading extends AssetsState {
  AssetsLoading(
      {required super.elementsRoots, required super.elementsFiltered});
}

final class AssetsSuccess extends AssetsState {
  AssetsSuccess(
      {required super.elementsRoots, required super.elementsFiltered});
}

final class AssetsError extends AssetsState {
  final String message;
  AssetsError({
    required this.message,
    required super.elementsRoots,
    required super.elementsFiltered,
  });
}
