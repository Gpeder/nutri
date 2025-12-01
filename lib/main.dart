import 'package:flutter/material.dart';
import 'package:nutri/core/theme/app_theme.dart';
import 'package:nutri/screens/root/root_page.dart';

import 'package:nutri/core/theme/theme_controller.dart';

void main() {
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
          home: RootPage(),
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: ThemeController.instance.themeMode,
        );
      },
    );
  }
}