import 'package:bookshelf/shared/infra/authentication/models/user.dart';
import 'package:bookshelf/shared/infra/authentication/port/authentication_service.dart';
import 'package:flutter/foundation.dart';
import 'package:signals_flutter/signals_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as s;

class SupabaseAuthenticationService extends AuthenticationService {
  SupabaseAuthenticationService() {
    currentUser = _api.onAuthStateChange
        .map((event) => event.session?.user.toUser)
        .toSignal();
  }

  final _api = s.Supabase.instance.client.auth;

  /// Logout
  @override
  Future<void> logout() async => _api.signOut();

  /// Login
  @override
  Future<void> loginWithOtp(String email) async {
    await _api.signInWithOtp(
      email: email,
      emailRedirectTo: kIsWeb ? null : 'fr.dachet.bookshelf://login-callback/',
    );
  }

  @override
  Future<void> loginWithEmail(String email, String password) async {
    await _api.signInWithPassword(email: email, password: password);
  }
}

extension _SupabaseUserX on s.User {
  User get toUser => User(id: id);
}
