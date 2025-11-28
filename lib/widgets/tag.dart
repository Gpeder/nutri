import 'package:flutter/material.dart';
import 'package:nutri/core/theme/colors.dart';

class Tag extends StatelessWidget {
  final String metric;
  const Tag({super.key, required this.metric});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.gray100,
      ),
      child: Text(
        metric,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
          color: AppColors.gray500,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}