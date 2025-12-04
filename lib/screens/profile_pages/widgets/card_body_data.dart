import 'package:flutter/material.dart';
import 'package:nutri/core/theme/app_theme.dart';
import 'package:nutri/core/theme/colors.dart';
import 'package:nutri/widgets/container_icon.dart';

class CardBodyData extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color iconColor;
  final Color bgColor;
  final double sizeIcon;
  const CardBodyData({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.iconColor,
    required this.bgColor,
    required this.sizeIcon,
    required this.isDark,
  });

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: isDark ? Theme.of(context).cardColor : AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDark ? Colors.grey.shade800 : AppColors.gray200,
          width: 0.5,
        ),
        boxShadow: AppTheme.softShadow,
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        visualDensity: VisualDensity.compact,
        leading: ContainerIcon(
          icon: icon,
          iconColor: iconColor,
          bgColor: bgColor,
          sizeIcon: sizeIcon,
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: isDark ? AppColors.gray200 : AppColors.gray500,
            fontWeight: FontWeight.w800,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: isDark ? AppColors.white : AppColors.gray900,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}
