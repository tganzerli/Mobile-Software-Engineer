import 'package:mobile_software_engineer/core/core.dart';

import '../repositories/check_internet.dart';

abstract class CheckInternetUseCase {
  Future<Output<bool>> call();
}

class CheckInternetUseCaseImpl extends CheckInternetUseCase {
  final CheckInternetRepository checkInternetRepository;
  CheckInternetUseCaseImpl({
    required this.checkInternetRepository,
  });

  @override
  Future<Output<bool>> call() async {
    return await checkInternetRepository.checkInternet();
  }
}
