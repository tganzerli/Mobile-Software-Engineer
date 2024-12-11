import 'package:mobile_software_engineer/core/core.dart';

import '../repositories/tree_element_repository.dart';

abstract class GetTreeElementsUsecase {
  Future<Output<List<TreeElementEntity>>> call(
      {required CompaniesEntity company});
}

class GetTreeElementsUsecaseImpl extends GetTreeElementsUsecase {
  final TreeElementRepository treeElementRepository;
  GetTreeElementsUsecaseImpl({
    required this.treeElementRepository,
  });

  @override
  Future<Output<List<TreeElementEntity>>> call(
      {required CompaniesEntity company}) async {
    return await treeElementRepository.getElements(company: company);
  }
}
