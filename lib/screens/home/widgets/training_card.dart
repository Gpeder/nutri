import 'package:flutter/material.dart';
import 'package:nutri/core/theme/app_theme.dart';
import 'package:nutri/widgets/customcheckbox.dart';

import 'package:nutri/core/theme/app_spacings.dart';

class TrainingCard extends StatelessWidget {
  final Color backgroundColor;
  final Color borderColor;
  final Color accentColor;
  final bool value;
  final ValueChanged<bool?> onChanged;
  final VoidCallback? onTap;
  final String title;
  final String subtitle;
  final IconData icon;

  const TrainingCard({
    super.key,
    required this.backgroundColor,
    required this.borderColor,
    required this.accentColor,
    required this.value,
    required this.onChanged,
    this.onTap,
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(AppSpacings.lg),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: borderColor),
          boxShadow: AppTheme.softShadow,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: accentColor,
                ),
                const SizedBox(width: AppSpacings.md),
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: accentColor,
                  ),
                ),
                const Spacer(),
                CustomCheckbox(
                  value: value,
                  color: accentColor,
                  onChanged: onChanged,
                ),
              ],
            ),
            const SizedBox(height: AppSpacings.lg),
            Text(
              subtitle,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
      ),
    );
  }
}
