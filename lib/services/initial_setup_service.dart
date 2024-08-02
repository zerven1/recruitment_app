import 'package:get_it/get_it.dart';
import 'package:recruitment_app/services/database_service.dart';
import 'package:recruitment_app/services/location_service.dart';
import 'package:recruitment_app/services/user_service.dart';
import 'package:recruitment_app/services/users_group_service.dart';

final GetIt getIt = GetIt.instance;

class InitialSetupService {
  void initialSetup() async {
    // Initial services
    getIt.registerSingleton<LocationService>(
      LocationService(),
    );
    getIt.registerSingleton<UserService>(UserService());
    getIt.registerSingleton<UsersGroupService>(UsersGroupService());
    getIt.registerSingletonAsync<DatabaseService>(() async {
      final service = DatabaseService();
      await service.database;
      return service;
    });
  }
}
