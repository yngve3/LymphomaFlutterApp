import 'package:supabase_flutter/supabase_flutter.dart';

class UserRepository {
  bool get isLoginIn => Supabase.instance.client.auth.currentUser != null;
  bool get isConfirmed => true;
}