import 'package:flutter/material.dart';
import 'package:nutri/core/theme/colors.dart';

import 'package:nutri/core/theme/app_spacings.dart';

class CustomTabBar extends StatelessWidget {
  final List<String> tabs;

  const CustomTabBar({
    super.key,
    required this.tabs,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: AppSpacings.md),
      decoration: BoxDecoration(
        color: AppColors.gray100,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TabBar(
        splashFactory: NoSplash.splashFactory,
        dividerColor: Colors.transparent,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorPadding: const EdgeInsets.all(AppSpacings.xxs),
        indicator: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        labelColor: AppColors.green200,
        unselectedLabelColor: AppColors.gray500,
        labelStyle: Theme.of(context).textTheme.titleMedium,
        unselectedLabelStyle: Theme.of(context).textTheme.titleMedium,
        tabs: tabs.map((tab) => Tab(text: tab)).toList(),
      ),
    );
  }
}
