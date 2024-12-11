import 'package:mobile_software_engineer/core/core.dart';

abstract class TreeElementRepository {
  Future<Output<List<TreeElementEntity>>> getElements(
      {required CompaniesEntity company});
}
