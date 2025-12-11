import 'package:flutter/material.dart';
import 'package:nutri/core/theme/app_theme.dart';
import 'package:nutri/core/theme/colors.dart';

class NextMeeting extends StatelessWidget {
  final String title;
  final String time;
  final String type;
  final String day;
  final String month;
  const NextMeeting({
    super.key,
    required this.title,
    required this.time,
    required this.type,
    required this.day,
    required this.month,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Theme.of(context).colorScheme.outline),
        boxShadow: AppTheme.softShadow,
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Container(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          decoration: BoxDecoration(
            color: AppColors.blue50,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(day,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: AppColors.blue200,
                      )),
              Text(month, style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        subtitle: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            children: [
              Icon(
                Icons.access_time,
                size: 16,
                color: AppColors.blue200,
              ),
              const SizedBox(width: 5),
              Text(time, style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(width: 10),
              Icon(
                Icons.circle,
                size: 16,
                color: AppColors.blue200,
              ),
              const SizedBox(width: 5),
              Text(type, style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
        ),
      ),
    );
  }
}