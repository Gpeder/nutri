import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nutri/core/theme/colors.dart';
import 'package:nutri/core/theme/app_theme.dart';

class ContainerWaterController extends StatefulWidget {
  const ContainerWaterController({super.key});

  @override
  State<ContainerWaterController> createState() =>
      _ContainerWaterControllerState();
}

class _ContainerWaterControllerState extends State<ContainerWaterController> {
  final List<bool> _buttonStates = List.generate(10, (index) => false);

  int get _totalWater =>
      _buttonStates.where((isActive) => isActive).length * 250;

  void _toggleButton(int index) {
    setState(() {
      if (_buttonStates[index]) {
        if (index == _buttonStates.length - 1 || !_buttonStates[index + 1]) {
          _buttonStates[index] = false;
        }
      } else {
        if (index == 0 || _buttonStates[index - 1]) {
          _buttonStates[index] = true;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),

      decoration: BoxDecoration(
        color: isDark ? Theme.of(context).cardColor : AppColors.blue75,
        boxShadow: AppTheme.softShadow,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.blue100, width: 1),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                FontAwesomeIcons.droplet,
                color: AppColors.blue200,
                size: 20,
              ),
              const SizedBox(width: 4),
              Text('Hidratação', style: Theme.of(context).textTheme.titleLarge),
              Spacer(),
              Text(
                '$_totalWater ml',
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(color: AppColors.blue200),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.center,
            children: List.generate(10, (index) {
              final isActive = _buttonStates[index];
              return WatterButton(
                color: isActive ? AppColors.blue200 : AppColors.blue125,
                borderColor: isActive ? AppColors.blue200 : AppColors.blue100,
                iconColor: isActive ? AppColors.white : AppColors.blue75,
                onTap: () => _toggleButton(index),
              );
            }),
          ),
          const SizedBox(height: 20),
          Text(
            'Meta diária: 2000ml (8copos)',
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(color: AppColors.blue200),
          ),
        ],
      ),
    );
  }
}

class WatterButton extends StatelessWidget {
  final Color color;
  final Color borderColor;
  final Color iconColor;
  final VoidCallback onTap;

  const WatterButton({
    super.key,
    required this.color,
    required this.borderColor,
    required this.iconColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: borderColor),
        ),
        child: Icon(FontAwesomeIcons.glassWater, color: iconColor),
      ),
    );
  }
}
