import 'package:firebase_admin_api/src/user/domain/user.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

class UserMapper {
  const UserMapper._();

  static User fromFirebaseUser(firebase_auth.User firebaseUser) {
    return User(
      displayName: firebaseUser.displayName,
      email: firebaseUser.email,
      emailVerified: firebaseUser.emailVerified,
      isAnonymous: firebaseUser.isAnonymous,
      phoneNumber: firebaseUser.phoneNumber,
      photoURL: firebaseUser.photoURL,
      refreshToken: firebaseUser.refreshToken,
      tenantId: firebaseUser.tenantId,
      uid: firebaseUser.uid,
    );
  }
}
