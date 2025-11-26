import 'package:flutter/material.dart';
import 'package:nutri/core/theme/colors.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class LinearProgress extends StatelessWidget {
  final double percent;

  const LinearProgress({super.key, required this.percent});

  Color _getProgressColor() {
    if (percent <= 0.70) {
      return AppColors.green200;
    } else if (percent <= 0.85) {
      return AppColors.yellow200;
    } else {
      return AppColors.red200;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LinearPercentIndicator(
          padding: EdgeInsets.zero,
          center: Text(
            '${(percent * 100).toInt()}%',
            style: Theme.of(
              context,
            ).textTheme.titleSmall?.copyWith(color: AppColors.white),
          ),
          animateToInitialPercent: true,
          animationDuration: 1000,
          animation: true,
          lineHeight: 20,
          percent: percent,
          progressColor: _getProgressColor(),
          backgroundColor: AppColors.gray100,
          barRadius: Radius.circular(10),
        ),
        SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Nutritivo',
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: AppColors.gray500),
            ),
            Text(
              'Processados',
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: AppColors.gray500),
            ),
          ],
        ),
      ],
    );
  }
}
