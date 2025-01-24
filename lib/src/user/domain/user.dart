class User {
  const User({
    this.displayName,
    this.email,
    this.emailVerified = false,
    this.isAnonymous = false,
    this.phoneNumber,
    this.photoURL,
    this.refreshToken,
    this.tenantId,
    required this.uid,
  });

  final String? displayName;
  final String? email;
  final bool emailVerified;
  final bool isAnonymous;
  final String? phoneNumber;
  final String? photoURL;
  final String? refreshToken;
  final String? tenantId;
  final String uid;

  User copyWith({
    String? displayName,
    String? email,
    bool? emailVerified,
    bool? isAnonymous,
    String? phoneNumber,
    String? photoURL,
    String? refreshToken,
    String? tenantId,
    String? uid,
  }) {
    return User(
      displayName: displayName ?? this.displayName,
      email: email ?? this.email,
      emailVerified: emailVerified ?? this.emailVerified,
      isAnonymous: isAnonymous ?? this.isAnonymous,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      photoURL: photoURL ?? this.photoURL,
      refreshToken: refreshToken ?? this.refreshToken,
      tenantId: tenantId ?? this.tenantId,
      uid: uid ?? this.uid,
    );
  }
}
