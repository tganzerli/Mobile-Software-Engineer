import 'dart:developer';

import 'package:mobile_software_engineer/core/core.dart';

class CompaniesAdapter {
  static CompaniesEntity fromMap(Map map) {
    try {
      return CompaniesEntity(id: map['id'], name: map['name']);
    } catch (e) {
      log(e.toString(), name: 'CompaniesAdapter - fromMap');
      rethrow;
    }
  }
}
