import 'package:flutter/material.dart';
import 'package:nutri/core/theme/colors.dart';

class Tag extends StatelessWidget {
  final String metric;
  const Tag({super.key, required this.metric});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: isDark ? Theme.of(context).scaffoldBackgroundColor : AppColors.gray100,
        border: isDark ? Border.all(color: Theme.of(context).colorScheme.outline) : null,
      ),
      child: Text(
        metric,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
          color: isDark ? Theme.of(context).colorScheme.onSurface : AppColors.gray500,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}