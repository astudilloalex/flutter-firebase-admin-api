import 'package:firebase_admin_api/app/middlewares/auth_middleware.dart';
import 'package:firebase_admin_api/src/auth/application/auth_service.dart';
import 'package:firebase_admin_api/src/auth/domain/i_auth_repository.dart';
import 'package:firebase_admin_api/src/auth/infrastructure/firebase_auth_repository.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

class Injection {
  const Injection._();

  static Future<void> registerDependencies() async {
    // Repositories
    getIt.registerLazySingleton<IAuthRepository>(
      () => const FirebaseAuthRepository(),
    );

    // Services
    getIt.registerFactory<AuthService>(
      () => AuthService(getIt<IAuthRepository>()),
    );

    // Middlewares
    getIt.registerFactory<AuthMiddleware>(
      () => AuthMiddleware(getIt<AuthService>()),
    );
  }
}
