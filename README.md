## Usage

```dart
Future<void> main(List<String> args) async {
  final db = PersistentDatabaseSembastService();
  await db.starting();
  final id = await db.create(
    objeto: {'user': 'João'},
    store: StoreSembast.toggle,
  );
  await db.get(id: id, store: StoreSembast.toggle);
}
```
