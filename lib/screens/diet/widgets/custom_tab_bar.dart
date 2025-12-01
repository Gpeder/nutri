import 'package:flutter/material.dart';
import 'package:nutri/core/theme/colors.dart';

class CustomTabBar extends StatelessWidget {
  final List<String> tabs;

  const CustomTabBar({
    super.key,
    required this.tabs,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: isDark ? Theme.of(context).colorScheme.surface : AppColors.gray100,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TabBar(
        splashFactory: NoSplash.splashFactory,
        dividerColor: Colors.transparent,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorPadding: const EdgeInsets.all(4),
        indicator: BoxDecoration(
          color: isDark ? Theme.of(context).cardColor : AppColors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        labelColor: isDark ? AppColors.green200 : AppColors.green200,
        unselectedLabelColor: isDark ? AppColors.gray400 : AppColors.gray500,
        labelStyle: Theme.of(context).textTheme.titleMedium,
        unselectedLabelStyle: Theme.of(context).textTheme.titleMedium,
        tabs: tabs.map((tab) => Tab(text: tab)).toList(),
      ),
    );
  }
}
