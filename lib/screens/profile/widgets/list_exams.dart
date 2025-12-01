import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nutri/core/theme/colors.dart';

class ListExams extends StatelessWidget {
  final String namePdf;
  final String statusPdf;
  const ListExams({super.key, required this.namePdf, required this.statusPdf});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        contentPadding: .zero,
        visualDensity: .compact,
        leading: const Icon(
          FontAwesomeIcons.fileLines,
          size: 20,
          color: AppColors.gray500,
        ),
        title: Text(
          namePdf,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(color: AppColors.gray500),
        ),
        trailing: Text(
          statusPdf,
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(color: AppColors.gray500),
        ),
      ),
    );
  }
}