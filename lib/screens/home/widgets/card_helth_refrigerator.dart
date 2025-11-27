import 'package:flutter/material.dart';
import 'package:nutri/core/theme/colors.dart';
import 'package:nutri/core/theme/app_theme.dart';
import 'package:nutri/screens/home/widgets/linear_progress.dart';
import 'package:nutri/widgets/custombadge.dart';

class CardHelthRefrigerator extends StatelessWidget {
  final double percent;
  const CardHelthRefrigerator({
    super.key,
    required this.percent,
  });

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
      padding: .symmetric(vertical: 20, horizontal: 15),
      decoration: BoxDecoration(
        color: AppColors.white,
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
              Container(
                padding: .symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: _getSecondaryColor(),
                  border: Border.all(color: _getPrimaryColor(), width: 0.5),
                  borderRadius: .circular(20),
                ),
                child: CustomBadge(
                  title: 'Nivel: ${_getText()}',
                  color: _getPrimaryColor(),
                  borderColor: _getSecondaryColor(),
                ),
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
