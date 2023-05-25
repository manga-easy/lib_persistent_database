import 'package:manga_easy_persistent_database_service/src/persistent_database_service.dart';
import 'package:manga_easy_persistent_database_service/src/sembast/store_sembast_enum.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:uuid/uuid.dart';

class PersistentDatabaseSembastService
    implements PersistentDatabaseService<StoreSembast> {
  late final Database _db;

  @override
  Future<void> starting() async {
    DatabaseFactory dbFactory = databaseFactoryIo;
    final dir = await getApplicationDocumentsDirectory();
    // We use the database factory to open the database
    _db = await dbFactory.openDatabase(join(dir.path, 'sembast_v1.db'));
  }

  @override
  Future<void> delete({
    required String id,
    required StoreSembast store,
  }) async {
    final storeref = StoreRef<String, dynamic>(store.name);
    await storeref.record(id).delete(_db);
  }

  @override
  Future<Map<String, dynamic>?> get({
    required String id,
    required StoreSembast store,
  }) async {
    final storeref = StoreRef<String, dynamic>(store.name);
    return await storeref.record(id).get(_db);
  }

  @override
  Future<void> deleteAll({required StoreSembast store}) async {
    final storeref = StoreRef<String, dynamic>(store.name);
    await storeref.drop(_db);
  }

  @override
  Future<String> create({
    required Map<String, dynamic> objeto,
    required StoreSembast store,
    String? id,
  }) async {
    final storeref = StoreRef<String, dynamic>(store.name);
    id ??= Uuid().v4();
    objeto['id'] = id;
    await storeref.record(id).put(_db, objeto);
    return id;
  }

  @override
  String get version => throw UnimplementedError();

  @override
  Future<void> update({
    required Map<String, dynamic> objeto,
    required StoreSembast store,
    required String id,
  }) async {
    final storeref = StoreRef<String, dynamic>(store.name);
    await storeref.record(id).put(_db, objeto);
  }

  @override
  Future<List<Map<String, dynamic>>> list({
    where,
    required StoreSembast store,
  }) async {
    final storeref = StoreRef<String, dynamic>(store.name);
    final result = await storeref.find(_db);
    return result.map((e) => Map<String, dynamic>.from(e.value)).toList();
  }
}
