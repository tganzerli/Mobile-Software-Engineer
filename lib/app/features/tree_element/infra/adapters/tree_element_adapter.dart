import 'dart:developer';

import 'package:mobile_software_engineer/core/core.dart';

class ElementsAdapter {
  static TreeElementEntity fromLocationsMap(Map map) {
    try {
      return TreeElementEntity(
        id: map['id'],
        type: Type.location,
        name: map['name'],
        parentId: map['parentId'],
      );
    } catch (e) {
      log(e.toString(), name: 'ElementsAdapter - fromLocationsMap');
      rethrow;
    }
  }

  static TreeElementEntity fromAssetsMap(Map map) {
    try {
      final Type type = map['sensorId'] == null ? Type.asset : Type.component;

      return TreeElementEntity(
        id: map['id'],
        type: type,
        name: map['name'],
        parentId: map['locationId'] ?? map['parentId'],
        sensorId: map['sensorId'],
        sensorType: map['sensorType'] == null
            ? null
            : SensorType.fromName(map['sensorType']),
        componentsStatus: map['status'] == null
            ? null
            : ComponentsStatus.fromName(map['status']),
        gatewayId: map['gatewayId'],
      );
    } catch (e) {
      log(e.toString(), name: 'ElementsAdapter - fromAssetsMap');
      rethrow;
    }
  }
}
