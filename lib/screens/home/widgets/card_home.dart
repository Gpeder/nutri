import 'package:flutter/material.dart';
import 'package:nutri/core/theme/colors.dart' show AppColors;
import 'package:nutri/core/theme/app_theme.dart';

class CardHome extends StatelessWidget {
  final IconData icon;
  final String value;
  final String subtitle;
  final Color bgColor;
  final Color iconColor;
  final Color borderColor;
  const CardHome({
    super.key,
    required this.icon,
    required this.value,
    required this.subtitle,
    required this.bgColor,
    required this.iconColor,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor, width: 0.5),
        boxShadow: AppTheme.softShadow,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(icon, color: iconColor),
          const SizedBox(height: 20),
          Text(value, style: Theme.of(context).textTheme.titleLarge),
          Text(
            subtitle,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: AppColors.gray500),
          ),
        ],
      ),
    );
  }
}
