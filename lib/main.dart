import 'package:flutter/material.dart';
import 'package:lymphoma/presentation/app/app.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'app_config.dart';
import 'di/dependencies.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await Supabase.initialize(
    url: AppConfig.databaseURL,
    anonKey: AppConfig.databaseAnonKey,
  );

  runApp(const App());
}
