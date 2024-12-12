import 'package:mobile_software_engineer/core/core.dart';

abstract class SplashState implements ViewState {
  SplashState();

  SplashInternetBlock internetBlock() {
    return SplashInternetBlock();
  }

  SplashSuccess success() {
    return SplashSuccess();
  }
}

final class SplashInitial extends SplashState {}

final class SplashInternetBlock extends SplashState {}

final class SplashSuccess extends SplashState {}
