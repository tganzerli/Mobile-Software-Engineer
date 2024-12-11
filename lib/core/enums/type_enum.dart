import 'package:mobile_software_engineer/core/core.dart';

enum Type {
  asset,
  component,
  location;

  String toMap() => name;

  factory Type.fromMap(String type) => Type.fromName(type);

  factory Type.fromName(String name) {
    return switch (name) {
      'asset' => Type.asset,
      'component' => Type.component,
      'location' => Type.location,
      _ => throw const DefaultException(message: 'Type not found'),
    };
  }
}
