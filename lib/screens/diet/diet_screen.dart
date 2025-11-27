import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nutri/core/theme/colors.dart';
import 'package:nutri/screens/diet/widgets/refrigeratorcard.dart';
import 'package:nutri/screens/diet/widgets/snackcard.dart';
import 'package:nutri/widgets/genericappbar.dart';
import 'package:nutri/screens/diet/widgets/custom_tab_bar.dart';

import 'package:nutri/services/model/snackmodel.dart';

import 'package:nutri/core/theme/app_spacings.dart';

class DietScreen extends StatelessWidget {
  const DietScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: const GenericAppBar(
          title: 'Nutrição',
          subtitle: 'Siga o plano ou cozinhe com o que tem.',
        ),
        body: Column(
          children: [
            const SizedBox(height: AppSpacings.lg),
            CustomTabBar(tabs: ['Meu Plano', 'Minha Geladeira']),

            const SizedBox(height: AppSpacings.lg),

            Expanded(
              child: TabBarView(
                children: [
                  _myPlan(),
                  Column(
                    crossAxisAlignment: .center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSpacings.lg,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: RefrigeratorCard(
                                title: '850',
                                subtitle: 'KCAL DISPONÍVEIS',
                              ),
                            ),
                            const SizedBox(width: AppSpacings.lg),
                            Expanded(
                              child: RefrigeratorCard(
                                title: 'ALTO',
                                titleColor: AppColors.green200,
                                subtitle: 'POTENCIAL PROTEICO',
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: AppSpacings.md),
                      Text(
                        'Dispensa & Geladeira',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  ListView _myPlan() {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacings.lg,
      ).copyWith(bottom: AppSpacings.lg),
      itemBuilder: (context, index) {
        if (index == dailyDietMock.length) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.only(top: AppSpacings.sm),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacings.lg),
                decoration: BoxDecoration(
                  color: AppColors.yellow50,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Icon(
                    FontAwesomeIcons.circleExclamation,
                    color: AppColors.yellow200,
                  ),
                  title: Text(
                    "Nota: Este plano é personalizado. Evite substituições sem consultar seu nutricionista.",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.yellow200,
                    ),
                  ),
                ),
              ),
            ),
          );
        }
        final snack = dailyDietMock[index];
        return SnackCard(
          title: snack.title,
          time: snack.time,
          items: snack.items,
          calories: snack.calories,
          protein: snack.protein,
          carbs: snack.carbs,
          fat: snack.fat,
        );
      },
      separatorBuilder: (context, index) =>
          const SizedBox(height: AppSpacings.md),
      itemCount: dailyDietMock.length + 1,
    );
  }
}
