import 'package:flutter/material.dart';
import 'package:nutri/core/theme/colors.dart';

class RefrigeratorCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color? titleColor;
  const RefrigeratorCard({
    super.key,
    required this.title,
    required this.subtitle,
    this.titleColor,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: isDark ? Colors.transparent : AppColors.gray100,
            blurRadius: 1,
            offset: const Offset(0, 1),
          ),
        ],
        color: isDark ? Theme.of(context).cardColor : AppColors.gray100,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: isDark ? Theme.of(context).cardColor : AppColors.gray100),
      ),
      child: Column(
        children: [
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: titleColor ?? Theme.of(context).colorScheme.onSurface,
                ),
          ),
          const SizedBox(height: 12),
          Text(
            subtitle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(color: AppColors.gray500),
          ),
        ],
      ),
    );
  }
}