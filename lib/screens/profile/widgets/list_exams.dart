import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nutri/core/theme/colors.dart';

class ListExams extends StatelessWidget {
  final String namePdf;
  final String statusPdf;
  const ListExams({super.key, required this.namePdf, required this.statusPdf});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: isDark ? Theme.of(context).cardColor : AppColors.gray50,
        borderRadius: BorderRadius.circular(10),
        border: isDark
            ? Border.all(color: Colors.grey.shade800, width: 0.5)
            : null,
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        visualDensity: VisualDensity.compact,
        leading: Icon(
          FontAwesomeIcons.fileLines,
          size: 20,
          color: isDark ? AppColors.gray400 : AppColors.gray500,
        ),
        title: Text(
          namePdf,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: isDark ? AppColors.gray200 : AppColors.gray500,
          ),
        ),
        trailing: Text(
          statusPdf,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: isDark ? AppColors.gray400 : AppColors.gray500,
          ),
        ),
      ),
    );
  }
}