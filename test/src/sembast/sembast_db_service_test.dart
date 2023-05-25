import 'package:manga_easy_persistent_database_service/src/sembast/sembast_db_service.dart';
import 'package:manga_easy_persistent_database_service/src/sembast/store_sembast_enum.dart';
import 'package:test/test.dart';

void main() {
  final db = PersistentDatabaseSembastService();
  setUpAll(() async {
    await db.starting();
    await db.deleteAll(store: StoreSembast.notification);
  });

  test('hive db create...', () async {
    final user = await db.create(
      objeto: {"user": "user"},
      store: StoreSembast.notification,
      id: '8c406013-f48b-4bb7-8a82-4629bbc7076f',
    );

    await db.create(
      objeto: {"user": "user"},
      store: StoreSembast.notification,
    );

    final getuser = await db.get(id: user, store: StoreSembast.notification);
    expect(getuser,
        {"user": "user", "id": '8c406013-f48b-4bb7-8a82-4629bbc7076f'});
  });
  test('hive db list', () async {
    final list = await db.list(store: StoreSembast.notification);
    for (var element in list) {
      print(element);
      expect(element['id'], isNotEmpty);
    }
  });

  test('hive db delete', () async {
    final list = await db.list(store: StoreSembast.notification);
    for (var element in list) {
      await db.delete(id: element['id'], store: StoreSembast.notification);
    }
    expect(await db.list(store: StoreSembast.notification), isEmpty);
  });
}
