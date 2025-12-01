import 'package:flutter/material.dart';
import 'package:nutri/core/theme/colors.dart';
import 'package:nutri/widgets/customcheckbox.dart';
import 'package:nutri/widgets/tag.dart';

class TrainingSelect extends StatelessWidget {
  final String title;
  final String series;
  final String? rest;
  final bool isCompleted;
  final Function() onTap;
  final Function(bool?) onChanged;
  const TrainingSelect({
    super.key,
    required this.title,
    required this.series,
    required this.rest,
    required this.isCompleted,
    required this.onChanged,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Theme.of(context).brightness == Brightness.dark
                ? Theme.of(context).colorScheme.outline
                : AppColors.gray200,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: isCompleted ? AppColors.gray400 : null,
                    decoration: isCompleted ? TextDecoration.lineThrough : null,
                    decorationColor: isCompleted ? AppColors.gray400 : null,
                  ),
                ),
                CustomCheckbox(
                  value: isCompleted,
                  onChanged: onChanged,
                  color: AppColors.green200,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              crossAxisAlignment: WrapCrossAlignment.center,
              runAlignment: WrapAlignment.center,
              children: [
                Tag(metric: 'Séries: $series'),
                if (rest != null) Tag(metric: 'Descanso: $rest'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}