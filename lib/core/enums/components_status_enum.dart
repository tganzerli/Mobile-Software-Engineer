import 'package:mobile_software_engineer/core/core.dart';

enum ComponentsStatus {
  alert,
  operating;

  String toMap() => name;

  factory ComponentsStatus.fromMap(String type) =>
      ComponentsStatus.fromName(type);

  factory ComponentsStatus.fromName(String name) {
    return switch (name) {
      'alert' => ComponentsStatus.alert,
      'operating' => ComponentsStatus.operating,
      _ => throw const DefaultException(message: 'Components status not found'),
    };
  }
}
