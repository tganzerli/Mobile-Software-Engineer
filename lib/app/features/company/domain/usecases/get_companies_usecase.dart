import 'package:mobile_software_engineer/core/core.dart';

import '../repositories/company_repository.dart';

abstract class GetCompaniesUsecase {
  Future<Output<List<CompaniesEntity>>> call();
}

class GetCompaniesUsecaseImpl extends GetCompaniesUsecase {
  final CompanyRepository companyRepository;
  GetCompaniesUsecaseImpl({
    required this.companyRepository,
  });

  @override
  Future<Output<List<CompaniesEntity>>> call() async {
    return await companyRepository.getCompanies();
  }
}
