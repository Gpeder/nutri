import 'package:flutter/material.dart';
import 'package:nutri/core/theme/colors.dart';

class ButtonFilter extends StatelessWidget {
  final bool isSelected;
  final String text;
  final VoidCallback onTap;

  const ButtonFilter({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        visualDensity: VisualDensity.compact,
        foregroundColor: isSelected ? AppColors.white : AppColors.gray400,
        backgroundColor: isSelected ? AppColors.gray900 : AppColors.gray50,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w800,
              color: isSelected ? AppColors.white : AppColors.gray400,
            ),
      ),
    );
  }
}