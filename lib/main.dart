import 'package:flutter/material.dart';
import 'package:nutri/core/theme/app_theme.dart';
import 'package:nutri/screens/login/login.dart';
import 'package:nutri/core/theme/theme_controller.dart';
import 'package:nutri/services/api.dart';

void main() {
  Api.setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: ThemeController.instance,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Nutri',
          home: const LoginPage(),
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: ThemeController.instance.themeMode,
        );
      },
    );
  }
}