import 'dart:developer';

import 'package:mobile_software_engineer/core/core.dart';

import '../../domain/repositories/check_internet.dart';
import '../datasources/check_internet_datasource.dart';

class CheckInternetRepositoryImpl extends CheckInternetRepository {
  final CheckInternetDataSource checkInternetDataSource;
  CheckInternetRepositoryImpl({
    required this.checkInternetDataSource,
  });

  @override
  Future<Output<bool>> checkInternet() async {
    try {
      final checkInternet = await checkInternetDataSource.checkInternet();

      if (checkInternet.statusCode == 200) {
        return right(true);
      } else {
        return right(false);
      }
    } on BaseException catch (e) {
      return left(e);
    } catch (e) {
      log(e.toString(), name: 'CheckInternetRepositoryImpl');
      rethrow;
    }
  }
}
