## Features

TODO: Essa lib é responsavel pelas regras de banco de dados locais do app

## Getting started

Adicione o package como depenencia no pubspec

```
manga_easy_persistent_database_service:
   git: 
    url: https://github.com/manga-easy/manga_easy_persistent_database_service.git
    ref: v1.1.1
```

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
