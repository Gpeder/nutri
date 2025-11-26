import 'package:flutter/material.dart';

class CustomBadge extends StatelessWidget {
  final String title;
  final Color color;
  final Color borderColor;
  const CustomBadge({
    super.key,
    required this.title,
    required this.color,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
        color: color,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
