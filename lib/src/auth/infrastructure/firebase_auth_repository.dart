import 'package:firebase_admin_api/app/error/failure.dart';
import 'package:firebase_admin_api/src/auth/domain/i_auth_repository.dart';
import 'package:firebase_admin_api/src/user/domain/user.dart';
import 'package:firebase_admin_api/src/user/infrastructure/user_mapper.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:fpdart/fpdart.dart';

class FirebaseAuthRepository implements IAuthRepository {
  const FirebaseAuthRepository();

  @override
  Future<Either<Failure, User>> signInWithGoogle({
    String? accessToken,
    String? idToken,
  }) async {
    final OAuthCredential oAuthCredential = GoogleAuthProvider.credential(
      accessToken: accessToken,
      idToken: idToken,
    );
    final UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(oAuthCredential);
    if (userCredential.user == null) {
      return const Left(
        FirebaseFailure(
          failureEnum: FailureEnum.userNotFound,
        ),
      );
    }
    return Right(UserMapper.fromFirebaseUser(userCredential.user!));
  }

  @override
  Stream<Either<Failure, User>> authStateChanges() {
    return FirebaseAuth.instance.authStateChanges().map((user) {
      if (user == null) {
        return const Left(
          FirebaseFailure(
            failureEnum: FailureEnum.theSessionHasBeenClosed,
          ),
        );
      }
      return Right(UserMapper.fromFirebaseUser(user));
    });
  }
}
