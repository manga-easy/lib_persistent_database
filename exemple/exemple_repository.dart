// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:manga_easy_persistent_database_service/manga_easy_persistent_database_service.dart';

class ExempleRepository {
  final PersistentDatabaseSembastService _persistentDatabaseSembastService;

  ExempleRepository(this._persistentDatabaseSembastService);

  void create(ExempleEntity entity) async {
    final id = await _persistentDatabaseSembastService.create(
      objeto: entity.toMap(),
      store: StoreSembast.exemple,
      id: entity.id, // se não passa id ele cria um uuid para registro
    );

    print(id);
  }
}

class ExempleEntity {
  String? id;
  String name;

  ExempleEntity({
    this.id,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory ExempleEntity.fromMap(Map<String, dynamic> map) {
    return ExempleEntity(
      id: map['id'],
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ExempleEntity.fromJson(String source) =>
      ExempleEntity.fromMap(json.decode(source) as Map<String, dynamic>);
}
