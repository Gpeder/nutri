import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:nutri/core/theme/colors.dart';

import 'package:nutri/core/theme/app_spacings.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      forceMaterialTransparency: true,
      bottom: const PreferredSize(
        preferredSize: Size.fromHeight(10),
        child: SizedBox(),
      ),
      title: ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text('Olá, Zé', style: Theme.of(context).textTheme.titleLarge),
        subtitle: Text(
          'Vamos manter o foco hoje?🚀',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        trailing: Container(
          padding: const EdgeInsets.all(AppSpacings.sm),
          decoration: BoxDecoration(
            color: AppColors.green100,
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.green200, width: 0.5),
          ),
          child: HeroIcon(
            HeroIcons.user,
            style: HeroIconStyle.solid,
            color: AppColors.green200,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 10);
}
