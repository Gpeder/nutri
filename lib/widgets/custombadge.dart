import 'package:flutter/material.dart';

class CustomBadge extends StatelessWidget {
  final String title;
  final Color color;
  final Color borderColor;
  final Color? backgroundColor;

  const CustomBadge({
    super.key,
    required this.title,
    required this.color,
    required this.borderColor,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: backgroundColor ?? color.withValues(alpha: 0.1),
        border: Border.all(color: borderColor, width: 0.5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        title,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: color,
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}
