import 'package:flutter/material.dart';

import 'core/routing/app_router.dart';
import 'generate.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();

  runApp( Generate(
    appRouter: AppRouter(),
  ),
  );
}
