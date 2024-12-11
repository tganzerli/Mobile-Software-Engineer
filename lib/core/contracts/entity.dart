import 'package:mobile_software_engineer/core/core.dart';

abstract class Entity {
  final String id;

  Entity({required this.id});

  Either<ValidationException, Entity> validate();

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Entity && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
