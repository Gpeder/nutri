import 'package:flutter/material.dart';
import 'package:nutri/core/theme/colors.dart';

class SnackCard extends StatelessWidget {
  final String title;
  final String time;
  final List<Map<String, String>> items;
  final double protein;
  final double carbs;
  final double fat;
  final double calories;

  const SnackCard({
    super.key,
    required this.title,
    required this.time,
    required this.items,
    required this.protein,
    required this.carbs,
    required this.fat,
    required this.calories,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 20,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.gray100),
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
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.gray100,
                ),
                child: Text(
                  time,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.gray500,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),
          ...items.map((foodItem) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                children: [
                  Icon(Icons.circle, size: 8, color: AppColors.green200),
                  const SizedBox(width: 12),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.gray900,
                        ),
                        children: [
                          TextSpan(text: "${foodItem['name']} "),
                          TextSpan(
                            text: "(${foodItem['qtd'] ?? ''})",
                            style: TextStyle(
                              color: AppColors.gray500,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
          const Divider(
            color: AppColors.gray400,
          ),
          const SizedBox(height: 5),
          Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            direction: Axis.horizontal,
            spacing: 5,
            runSpacing: 5,
            children: [
              _buildMacroItem(context, '${calories.toInt()} kcal', Colors.grey.shade700),
              _buildMacroItem(context, '${protein.toInt()}g Prot', Colors.blue.shade600),
              _buildMacroItem(context, '${carbs.toInt()}g Carb', Colors.orange.shade600),
              _buildMacroItem(context, '${fat.toInt()}g Gord', Colors.red.shade400),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMacroItem(BuildContext context, String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: .1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: color,
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}
