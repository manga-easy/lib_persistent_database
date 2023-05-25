import 'package:manga_easy_persistent_database_service/src/hive/box_hive_enum.dart';
import 'package:manga_easy_persistent_database_service/src/hive/hive_db_service.dart';
import 'package:test/test.dart';

void main() {
  var db = PersistentDatabaseHiveService();
  setUpAll(() async {
    await db.starting();
  });

  test('hive db create...', () async {
    final user = await db.create(
      objeto: {"user": "user"},
      store: BoxHive.global,
      id: '8c406013-f48b-4bb7-8a82-4629bbc7076f',
    );

    await db.create(
      objeto: {"user": "user"},
      store: BoxHive.global,
    );

    final getuser = await db.get(id: user, store: BoxHive.global);
    expect(getuser,
        {"user": "user", "id": '8c406013-f48b-4bb7-8a82-4629bbc7076f'});
  });
  test('hive db list', () async {
    final list = await db.list(store: BoxHive.global);
    for (var element in list) {
      print(element);
      expect(element['id'], isNotEmpty);
    }
  });

  test('hive db delete', () async {
    final list = await db.list(store: BoxHive.global);
    for (var element in list) {
      await db.delete(id: element['id'], store: BoxHive.global);
    }
    expect(await db.list(store: BoxHive.global), isEmpty);
  });
}
