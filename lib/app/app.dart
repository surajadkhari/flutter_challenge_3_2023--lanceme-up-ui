import 'package:flutter/material.dart';
import '../features/splash_screen/presentation/splash_screen.dart';
import '../utils/app_theme/app_theme.dart';

class LancemeUpApp extends StatelessWidget {
  const LancemeUpApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = LancemeUpAppTheme.light();
    return MaterialApp(
      theme: theme,
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
