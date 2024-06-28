import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepository {
  Future<void> register({
    required String email,
    required String password,
    Map<String, dynamic>? userData,
  }) async {
    try {
      await Supabase.instance.client.auth.signUp(
          email: email,
          password: password,
          data: userData
      );
    } on AuthException catch (_) {
      rethrow;
    }
  }

  Future<void> login({
    required String email,
    required String password
  }) async {
    try {
      await Supabase.instance.client.auth.signInWithPassword(
          email: email,
          password: password
      );
    } on AuthException catch (_) {
      rethrow;
    }
  }
}