import 'package:flutter/material.dart';
import 'package:nutri/core/theme/colors.dart';
import 'package:nutri/core/theme/app_theme.dart';
import 'package:nutri/widgets/custombadge.dart';
import 'package:percent_indicator/linear_percent_indicator.dart'
    show LinearPercentIndicator;

class CardHelthRefrigerator extends StatelessWidget {
  final double percent;
  const CardHelthRefrigerator({super.key, required this.percent});

  Color _getPrimaryColor() {
    if (percent <= 0.70) {
      return AppColors.green200;
    } else if (percent <= 0.85) {
      return AppColors.yellow200;
    } else {
      return AppColors.red200;
    }
  }

  Color _getSecondaryColor() {
    if (percent <= 0.70) {
      return AppColors.green100;
    } else if (percent <= 0.85) {
      return AppColors.yellow100;
    } else {
      return AppColors.red100;
    }
  }

  String _getText() {
    if (percent <= 0.70) {
      return 'Bom';
    } else if (percent <= 0.85) {
      return 'Regular';
    } else {
      return 'Ruim';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        boxShadow: AppTheme.softShadow,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.gray100, width: 1),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.kitchen_rounded, color: _getPrimaryColor(), size: 20),
              SizedBox(width: 5),
              Text(
                'Saude da geladeira',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Spacer(),
                CustomBadge(
                  title: 'Nivel: ${_getText()}',
                  color: _getPrimaryColor(),
                  borderColor: _getPrimaryColor(),
                  backgroundColor: _getSecondaryColor(),
                ),
            ],
          ),
          SizedBox(height: 20),
          //* grafico da geladeira
          LinearProgress(percent: percent),
        ],
      ),
    );
  }
}

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
          lineHeight: 18,
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
