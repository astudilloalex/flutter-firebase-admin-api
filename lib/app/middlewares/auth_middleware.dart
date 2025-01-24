import 'dart:async';

import 'package:firebase_admin_api/app/error/failure.dart';
import 'package:firebase_admin_api/src/auth/application/auth_service.dart';
import 'package:firebase_admin_api/src/user/domain/user.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';

class AuthMiddleware extends ChangeNotifier {
  AuthMiddleware(this.authService) {
    _subscription = authService.authStateChanges().listen((result) {
      result.fold(
        (failure) {
          _loggedIn = false;
          _currentUser = null;
        },
        (user) {
          _loggedIn = true;
          _currentUser = user;
        },
      );
      notifyListeners();
    });
  }

  final AuthService authService;
  late final StreamSubscription<Either<Failure, User>> _subscription;
  bool _loggedIn = true;
  User? _currentUser;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  bool get loggedIn => _loggedIn;
  User? get currentUser => _currentUser;
}
