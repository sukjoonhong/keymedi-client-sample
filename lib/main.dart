import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:keymedi_client/presentation/screens/main_screen.dart';

import 'config/app_config.dart';
import 'logger.dart';

Future<void> main() async {
  await initConfig();
  runApp(const KeymediClient());
}

Future<void> initConfig() async {
  const flavor = String.fromEnvironment('FLAVOR', defaultValue: 'local');

  await dotenv.load(fileName: '.env.$flavor');

  logger.i('AppConfig', 'Loaded environment: ${dotenv.env['ENV']}');

  AppConfig().initialize(
    androidBackendEndpoint:
    dotenv.env['ANDROID_BACKEND_ENDPOINT'] ?? '10.0.2.2',
    iosBackendEndpoint: dotenv.env['IOS_BACKEND_ENDPOINT'] ?? 'localhost',
    environment: dotenv.env['ENV'] ?? 'unknown',
  );
}

class KeymediClient extends StatelessWidget {
  const KeymediClient({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Keymedi client',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
        home: const MainScreen()
    );
  }
}
