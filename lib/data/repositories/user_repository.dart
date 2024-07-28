import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../consts/strings.dart';

@injectable
class UserRepository {
  bool get isLoginIn => Supabase.instance.client.auth.currentUser != null;
  String? get id => Supabase.instance.client.auth.currentUser?.id;
  String? get role => Supabase.instance.client.auth.currentUser?.userMetadata?[TableFieldNames.role];
}