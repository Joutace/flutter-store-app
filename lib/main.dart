import 'package:flutter/material.dart';
import 'package:flutter_challange/shared/routes/app_router.dart';
import 'package:flutter_challange/shared/themes/app_colors.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'di/app_providers.dart';

Future<void> mainInit() async {
  await dotenv.load();
  await AppProviders().init();
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await mainInit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Tecnofit Challange',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}
