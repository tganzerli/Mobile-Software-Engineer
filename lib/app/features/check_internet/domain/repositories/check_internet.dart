import 'package:mobile_software_engineer/core/core.dart';

abstract class CheckInternetRepository {
  Future<Output<bool>> checkInternet();
}
