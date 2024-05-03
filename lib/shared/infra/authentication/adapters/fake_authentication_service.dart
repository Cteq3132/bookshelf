import 'dart:async';

import 'package:bookshelf/shared/infra/authentication/models/user.dart';
import 'package:bookshelf/shared/infra/authentication/port/authentication_service.dart';
import 'package:signals_flutter/signals_flutter.dart';

class FakeAuthenticationService extends AuthenticationService {
  FakeAuthenticationService({
    required bool isLoggedIn,
  }) {
    _currentUserStream = StreamController<User?>.broadcast();
    currentUser = _currentUserStream.stream
        .toSignal(initialValue: isLoggedIn ? _fakeUser : null);
  }

  final _fakeUser = const User(id: 'fake');
  late final StreamController<User?> _currentUserStream;

  @override
  void dispose() {
    _currentUserStream.close();
    super.dispose();
  }

  @override
  Future<void> logout() async => _currentUserStream.add(null);

  @override
  Future<void> loginWithOtp(String email) async {
    _currentUserStream.add(_fakeUser);
  }

  @override
  Future<void> loginWithEmail(String email, String password) async {
    _currentUserStream.add(_fakeUser);
  }
}
