import 'package:manga_easy_persistent_database_service/manga_easy_persistent_database_service.dart';
import 'package:manga_easy_persistent_database_service/src/user_preference/user_preference_entity.dart';

class PreferenceService {
  final PersistentDatabaseSembastService _persistentDatabaseSembastService;

  PreferenceService(this._persistentDatabaseSembastService);

  Future<T> get<T>({required KeyPreferences keyPreferences}) async {
    final result = await _persistentDatabaseSembastService.get(
      id: keyPreferences.key,
      store: StoreSembast.userPreference,
    );
    if (result == null) {
      return keyPreferences.defaultValue;
    }
    final userPreference = UserPreferenceEntity.fromJson(result);
    return userPreference.value ?? keyPreferences.defaultValue;
  }

  Future<void> put<T>({
    required T value,
    required KeyPreferences keyPreferences,
  }) async {
    await _persistentDatabaseSembastService.update(
      id: keyPreferences.key,
      objeto: UserPreferenceEntity(
        value: value,
        id: keyPreferences.key,
      ).toJson(),
      store: StoreSembast.userPreference,
    );
  }

  Future<void> delete({required KeyPreferences keyPreferences}) async {
    await _persistentDatabaseSembastService.delete(
      id: keyPreferences.key,
      store: StoreSembast.userPreference,
    );
  }
}
