import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nutri/core/theme/app_theme.dart';
import 'package:nutri/core/theme/colors.dart';
import 'package:nutri/widgets/container_icon.dart';
import 'package:nutri/widgets/custombadge.dart';

class MedicalExamCard extends StatelessWidget {
  final String title;
  final String date;
  final String status;
  final String filePath;

  const MedicalExamCard({
    super.key,
    required this.title,
    required this.date,
    required this.status,
    required this.filePath,
  });

  bool get _isImage {
    final ext = filePath.split('.').last.toLowerCase();
    return ['jpg', 'jpeg', 'png'].contains(ext);
  }

  IconData get _icon {
    return _isImage ? FontAwesomeIcons.image : FontAwesomeIcons.fileLines;
  }

  Color get _iconColor {
    return _isImage ? AppColors.blue200 : AppColors.red200;
  }

  Color get _iconBgColor {
    return _isImage ? AppColors.blue50 : AppColors.red50;
  }

  Color get _statusColor {
    switch (status.toLowerCase()) {
      case 'enviado':
        return AppColors.blue200;
      case 'analisando':
        return AppColors.yellow200;
      case 'visualizado':
        return AppColors.green200;
      default:
        return AppColors.gray500;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Theme.of(context).colorScheme.outline),
        boxShadow: AppTheme.softShadow,
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        visualDensity: VisualDensity.compact,
        leading: ContainerIcon(
          icon: _icon,
          iconColor: _iconColor,
          bgColor: _iconBgColor,
          sizeIcon: 20,
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).textTheme.titleMedium?.color,
              ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 2),
          child: Text(
            date,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.gray500,
                ),
          ),
        ),
        trailing: CustomBadge(
          title: status,
          color: _statusColor,
          borderColor: _statusColor,
        ),
      ),
    );
  }
}
