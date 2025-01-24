import 'package:firebase_admin_api/app/error/failure.dart';
import 'package:firebase_admin_api/src/auth/domain/i_auth_repository.dart';
import 'package:firebase_admin_api/src/user/domain/user.dart';
import 'package:fpdart/fpdart.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  const AuthService(this._repository);

  final IAuthRepository _repository;

  Future<Either<Failure, User>> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      return await _repository.signInWithGoogle(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
    } catch (e) {
      return Left(FirebaseFailure(message: e.toString()));
    }
  }

  Stream<Either<Failure, User>> authStateChanges() {
    return _repository.authStateChanges();
  }
}
