import 'package:mobile_software_engineer/app/features/check_internet/domain/usecases/check_internet_usecase.dart';
import 'package:mobile_software_engineer/core/core.dart';

import 'splash_states.dart';

class SplashViewModels extends ViewModel<SplashState> {
  final CheckInternetUseCase checkInternetUseCase;
  SplashViewModels({
    required this.checkInternetUseCase,
  }) : super(SplashInitial());

  Future<void> initEvent() async {
    await Future.delayed(const Duration(seconds: 2));
    final checkInternet = await checkInternetUseCase();

    checkInternet.fold(
      (internetException) {
        emit(state.internetBlock());
      },
      (hasInternet) {
        emit(state.success());
      },
    );
  }
}
