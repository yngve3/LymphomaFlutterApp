import 'package:flutter/material.dart';
import 'package:lymphoma/presentation/app/app.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const App());
}
