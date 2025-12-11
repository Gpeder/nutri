import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

class AppTheme {
  static const Color _lightBg = Color(0xFFffffff);
  static const Color _lightSurface = Colors.white;
  static const Color _lightTextMain = Color(0xFF111827);
  static const Color _lightTextSec = Color(0xFF6B7280);
  static const Color _lightBorder = Color(0xFFF3F4F6);
  static const Color _lightPrimary = Color(0xFF059669);

  static const Color _darkBg = Color(0xFF020617);
  static const Color _darkSurface = Color(0xFF0F172A);
  static const Color _darkContainer = Color(0xFF1E293A); 
  static const Color _darkTextMain = Colors.white;
  static const Color _darkTextSec = Color(0xFF9CA3AF);
  static const Color _darkBorder = Color(0xFF1E293B);
  static const Color _darkPrimary = Color(0xFF34D399);
  
  static final List<BoxShadow> softShadow = [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.03),
      blurRadius: 10,
      offset: const Offset(0, 4),
    ),
  ];

  static final ButtonStyle primaryButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: AppColors.green200,
    foregroundColor: AppColors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5),
    ),
  );

  static TextTheme _buildTextTheme(Color mainTextColor) {
    final baseTextTheme = GoogleFonts.interTextTheme();
    final bodyTextTheme = GoogleFonts.inter();

    return baseTextTheme.copyWith(
      headlineSmall: baseTextTheme.headlineSmall?.copyWith(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: mainTextColor,
      ),
      titleLarge: baseTextTheme.titleLarge?.copyWith(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: mainTextColor,
      ),
      titleMedium: baseTextTheme.titleMedium?.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: mainTextColor,
      ),
      bodyMedium: bodyTextTheme.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        height: 1.5,
        color: mainTextColor,
      ),
      bodySmall: bodyTextTheme.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: mainTextColor.withValues(alpha: 0.7),
      ),
    );
  }

  static InputDecorationTheme _buildInputDecorationTheme({
    required Color baseColor,
    required Color focusColor,
    required Color errorColor,
  }) {
    return InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: baseColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: focusColor, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: errorColor),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: errorColor, width: 2),
      ),
    );
  }

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: _lightBg,
      primaryColor: _lightPrimary,
      cardColor: Colors.white,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
      ),
      colorScheme: const ColorScheme.light(
        primary: _lightPrimary,
        surface: _lightSurface,
        onSurface: _lightTextMain,
        outline: _lightBorder,
        error: AppColors.red200,
      ),
      textTheme: _buildTextTheme(_lightTextMain),
      inputDecorationTheme: _buildInputDecorationTheme(
        baseColor: AppColors.gray200,
        focusColor: AppColors.green200,
        errorColor: AppColors.red200,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.white,
          foregroundColor: AppColors.green200,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: _darkBg,
      primaryColor: _darkPrimary,
      cardColor: _darkContainer,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: _darkSurface,
      ),
      colorScheme: const ColorScheme.dark(
        primary: _darkPrimary,
        surface: _darkSurface,
        onSurface: _darkTextMain,
        outline: _darkBorder,
        error: AppColors.red200,
      ),
      textTheme: _buildTextTheme(_darkTextMain),
      inputDecorationTheme: _buildInputDecorationTheme(
        baseColor: _darkBorder,
        focusColor: AppColors.emerald400,
        errorColor: AppColors.red200,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.slate800,
          foregroundColor: AppColors.emerald400,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  static of(BuildContext context) {}
}