import 'package:bookshelf/shared/infra/authentication/models/user.dart';
import 'package:equatable/equatable.dart';
import 'package:signals_flutter/signals_flutter.dart';

abstract class AuthenticationService extends Equatable {
  /// Current user signal
  late final StreamSignal<User?> currentUser;

  /// Computed signal that only emits when the user is logged in / out
  late final isLoggedIn = computed(() => currentUser().value != null);

  void dispose() {
    currentUser.dispose();
  }

  /// Logout
  Future<void> logout();

  /// Login
  Future<void> loginWithOtp(String email);

  @override
  List<Object?> get props => [];
}
