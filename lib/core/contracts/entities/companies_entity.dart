import 'dart:convert';

import 'package:mobile_software_engineer/core/core.dart';

class CompaniesEntity extends Entity {
  final String name;

  CompaniesEntity({required super.id, required this.name});

  @override
  Either<ValidationException, Entity> validate() {
    return right(this);
  }

  CompaniesEntity copyWith({
    String? name,
  }) {
    return CompaniesEntity(
      id: super.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': super.id,
      'name': name,
    };
  }

  factory CompaniesEntity.fromMap(Map<String, dynamic> map) {
    return CompaniesEntity(
      id: map['id'],
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CompaniesEntity.fromJson(String source) =>
      CompaniesEntity.fromMap(json.decode(source));
}
