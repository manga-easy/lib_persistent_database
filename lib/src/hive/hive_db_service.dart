import 'dart:async';
import 'dart:io';
import 'package:hive/hive.dart';
import 'package:manga_easy_persistent_database_service/src/hive/box_hive_enum.dart';
import 'package:manga_easy_persistent_database_service/src/persistent_database_service.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';
import 'package:path/path.dart' as p;

class PersistentDatabaseHiveService
    implements PersistentDatabaseService<BoxHive> {
  Map<BoxHive, Box> mapBox = {};

  @override
  String get version => '1.0';

  @override
  Future<void> starting() async {
    String path = 'hive';
    if (Platform.isAndroid) {
      final appDir = await getApplicationDocumentsDirectory();
      path = p.join(appDir.path);
    }

    Hive.init(path);
    await _loadingBoxes();
  }

  Future<void> _loadingBoxes() async {
    await Future.wait(
      BoxHive.values.map((e) => _setBox(e)).toList(),
    );
  }

  Future<void> _setBox(BoxHive boxHive) async {
    mapBox[boxHive] = await Hive.openBox(boxHive.name);
  }

  Box _getBox(BoxHive name) {
    final box = mapBox[name];
    if (box == null) {
      throw Exception('Tabela não foi criada');
    }
    return box;
  }

  @override
  Future<String> create({
    required Map<String, dynamic> objeto,
    required BoxHive store,
    String? id,
  }) async {
    final box = _getBox(store);

    id ??= Uuid().v4();
    if (id.isEmpty) {
      throw Exception('ID não pode ser vazio');
    }
    objeto['id'] = id;

    await box.put(id, objeto);

    return id;
  }

  @override
  Future<void> delete({required String id, required BoxHive store}) async {
    final box = _getBox(store);

    box.delete(id);
  }

  @override
  Future<void> deleteAll({required BoxHive store}) async {
    final box = _getBox(store);

    box.clear();
  }

  @override
  Future<Map<String, dynamic>?> get({
    required String id,
    required BoxHive store,
  }) async {
    final box = _getBox(store);

    return box.get(id);
  }

  @override
  Future<List<Map<String, dynamic>>> list({
    where,
    required BoxHive store,
  }) async {
    final box = _getBox(store);

    return box.values.map((e) => Map<String, dynamic>.from(e)).toList();
  }

  @override
  Future<void> update({
    required Map<String, dynamic> objeto,
    required BoxHive store,
    required String id,
  }) async {
    final tablet = _getBox(store);

    await tablet.put(id, objeto);
  }
}
