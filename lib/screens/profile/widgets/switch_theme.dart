import 'package:flutter/material.dart';
import 'package:nutri/core/theme/colors.dart';
import 'package:nutri/core/theme/theme_controller.dart';
import 'package:nutri/core/theme/app_theme.dart';

class SwitchThemeApp extends StatelessWidget {
  const SwitchThemeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: ThemeController.instance,
      builder: (context, child) {
        final bool isDark = ThemeController.instance.isDark;
          return Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Theme.of(context).colorScheme.outline),
              boxShadow: AppTheme.softShadow,
            ),
            child: Row(
              children: [
                Icon(
                  isDark ? Icons.nights_stay : Icons.sunny,
                  color: isDark ? AppColors.blue200 : AppColors.yellow200,
                ),
                const SizedBox(width: 10),
                Text(
                  isDark ? 'Modo escuro' : 'Modo claro',
                  style: Theme.of(
                    context,
                  ).textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                ),
              const Spacer(),
              Switch(
                activeThumbColor: AppColors.blue100,
                activeTrackColor: AppColors.blue200,
                inactiveThumbColor: AppColors.yellow200,
                inactiveTrackColor: AppColors.yellow100,
                trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                value: isDark,
                onChanged: (value) {
                  ThemeController.instance.toggleTheme();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
