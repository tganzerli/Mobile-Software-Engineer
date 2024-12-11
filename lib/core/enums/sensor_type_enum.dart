import 'package:mobile_software_engineer/core/core.dart';

enum SensorType {
  energy,
  vibration;

  String toMap() => name;

  factory SensorType.fromMap(String type) => SensorType.fromName(type);

  factory SensorType.fromName(String name) {
    return switch (name) {
      'energy' => SensorType.energy,
      'vibration' => SensorType.vibration,
      _ => throw const DefaultException(message: 'Sensor type not found'),
    };
  }
}
