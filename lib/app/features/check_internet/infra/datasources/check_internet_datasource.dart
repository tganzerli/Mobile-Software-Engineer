import 'package:mobile_software_engineer/core/core.dart';

abstract class CheckInternetDataSource {
  Future<RestClientResponse> checkInternet();
}
