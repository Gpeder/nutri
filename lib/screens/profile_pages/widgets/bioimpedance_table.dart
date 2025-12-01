import 'package:flutter/material.dart';
import 'package:nutri/core/theme/app_theme.dart';
import 'package:nutri/core/theme/colors.dart';

class BioimpedanceTable extends StatelessWidget {
  final String datebioimpedance;
  final String wheightNow;
  final String bodyFat;
  final String muscleMass;
  final String metabolicRate;
  const BioimpedanceTable({
    super.key,
    required this.isDark,
    required this.datebioimpedance,
    required this.wheightNow,
    required this.bodyFat,
    required this.muscleMass,
    required this.metabolicRate,
  });

  final bool isDark;

  Color _getBodyFatColor() {
    final valueString = bodyFat.replaceAll('%', '').trim();
    final value = double.tryParse(valueString) ?? 0.0;

    if (value <= 20) {
      return AppColors.green200;
    } else if (value <= 28) {
      return AppColors.yellow200;
    } else {
      return AppColors.red200;
    }
  }

  @override
  Widget build(BuildContext context) {
    final bfColor = _getBodyFatColor();

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: isDark ? Theme.of(context).cardColor : AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.gray200, width: 0.5),
        boxShadow: AppTheme.softShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Bioimpedância Recente',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Atualizado em $datebioimpedance',
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(color: AppColors.gray500),
                ),
              ],
            ),
          ),

          Divider(height: 1, color: AppColors.gray200),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Table(
              columnWidths: const {
                0: FlexColumnWidth(1),
                1: IntrinsicColumnWidth(),
              },
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              border: TableBorder(
                horizontalInside: BorderSide(
                  color: AppColors.gray200,
                  width: 0.5,
                ),
              ),
              children: [
                _buildTableRow(context, 'Peso Atual', wheightNow),

                TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Text(
                        'Gordura Corporal (BF)',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.gray500,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.circle,
                            color: bfColor,
                            size: 12,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            bodyFat,
                            style: Theme.of(context).textTheme.bodyLarge
                                ?.copyWith(
                                  fontWeight: FontWeight.w800,
                                  color: bfColor,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                _buildTableRow(context, 'Massa Muscular', muscleMass),
                _buildTableRow(context, 'Taxa Metabólica (TMB)', metabolicRate),
              ],
            ),
          ),
          const SizedBox(height: 5),
        ],
      ),
    );
  }
}

TableRow _buildTableRow(BuildContext context, String label, String value) {
  return TableRow(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Text(
          label,
          style: Theme.of(
            context,
          ).textTheme.bodyLarge?.copyWith(color: AppColors.gray500),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Text(
          value,
          textAlign: TextAlign.right,
          style: Theme.of(
            context,
          ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w800),
        ),
      ),
    ],
  );
}
