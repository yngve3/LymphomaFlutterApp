import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@injectable
class AuthRepository {
  Future<User?> register({
    required String email,
    required String password,
    Map<String, dynamic>? userData,
  }) async {
    try {
      final res = await Supabase.instance.client.auth.signUp(
          email: email,
          password: password,
          data: userData
      );
      return res.user;
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

  void logout() => Supabase.instance.client.auth.signOut();
}