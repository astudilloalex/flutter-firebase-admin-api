import 'package:firebase_admin_api/app/error/failure.dart';
import 'package:firebase_admin_api/src/user/domain/user.dart';
import 'package:fpdart/fpdart.dart';

abstract class IAuthRepository {
  const IAuthRepository();

  Future<Either<Failure, User>> signInWithGoogle({
    String? accessToken,
    String? idToken,
  });

  Stream<Either<Failure, User>> authStateChanges();
}
