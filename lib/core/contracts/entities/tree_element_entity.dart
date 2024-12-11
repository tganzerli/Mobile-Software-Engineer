import 'dart:convert';

import 'package:flutter/widgets.dart';

import 'package:mobile_software_engineer/core/core.dart';

class TreeElementEntity extends Entity {
  final Type type;
  final String name;
  final String? parentId;
  final String? sensorId;
  final SensorType? sensorType;
  final ComponentsStatus? componentsStatus;
  final String? gatewayId;
  List<TreeElementEntity> children;

  TreeElementEntity({
    required super.id,
    required this.type,
    required this.name,
    this.parentId,
    this.sensorId,
    this.sensorType,
    this.componentsStatus,
    this.gatewayId,
    this.children = const [],
  });

  @override
  Either<ValidationException, Entity> validate() {
    if (type == Type.component) {
      if (sensorId == null) {
        return left(
            ValidationException(message: 'The sensor ID cannot be null.'));
      }
      if (sensorType == null) {
        return left(
            ValidationException(message: 'The sensor type cannot be null.'));
      }
      if (componentsStatus == null) {
        return left(ValidationException(
            message: 'The component status cannot be null.'));
      }
      if (gatewayId == null) {
        return left(
            ValidationException(message: 'The gateway ID cannot be null.'));
      }
    }
    return right(this);
  }

  TreeElementEntity copyWith({
    Type? type,
    String? name,
    ValueGetter<String?>? parentId,
    ValueGetter<String?>? sensorId,
    ValueGetter<SensorType?>? sensorType,
    ValueGetter<ComponentsStatus?>? componentsStatus,
    ValueGetter<String?>? gatewayId,
    List<TreeElementEntity>? children,
  }) {
    return TreeElementEntity(
      id: super.id,
      type: type ?? this.type,
      name: name ?? this.name,
      parentId: parentId != null ? parentId() : this.parentId,
      sensorId: sensorId != null ? sensorId() : this.sensorId,
      sensorType: sensorType != null ? sensorType() : this.sensorType,
      componentsStatus:
          componentsStatus != null ? componentsStatus() : this.componentsStatus,
      gatewayId: gatewayId != null ? gatewayId() : this.gatewayId,
      children: children ?? this.children,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': super.id,
      'type': type.toMap(),
      'name': name,
      'parentId': parentId,
      'sensorId': sensorId,
      'sensorType': sensorType?.toMap(),
      'componentsStatus': componentsStatus?.toMap(),
      'gatewayId': gatewayId,
      'children': children.map((x) => x.toMap()).toList(),
    };
  }

  factory TreeElementEntity.fromMap(Map<String, dynamic> map) {
    return TreeElementEntity(
      id: map['id'],
      type: Type.fromMap(map['type']),
      name: map['name'],
      parentId: map['parentId'],
      sensorId: map['sensorId'],
      sensorType: map['sensorType'] != null
          ? SensorType.fromMap(map['sensorType'])
          : null,
      componentsStatus: map['componentsStatus'] != null
          ? ComponentsStatus.fromMap(map['componentsStatus'])
          : null,
      gatewayId: map['gatewayId'],
      children: List<TreeElementEntity>.from(
          map['children']?.map((x) => TreeElementEntity.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory TreeElementEntity.fromJson(String source) =>
      TreeElementEntity.fromMap(json.decode(source));
}
