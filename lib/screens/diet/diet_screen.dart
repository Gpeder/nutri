import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nutri/core/theme/colors.dart';
import 'package:nutri/models/refrigetor_model.dart';
import 'package:nutri/screens/diet/widgets/refrigeratorcard.dart';
import 'package:nutri/screens/diet/widgets/snackcard.dart';
import 'package:nutri/widgets/genericappbar.dart';
import 'package:nutri/screens/diet/widgets/custom_tab_bar.dart';

import 'package:nutri/models/snack_model.dart';
import 'package:nutri/widgets/notice_cards.dart';

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
            const SizedBox(height: 20),
            CustomTabBar(tabs: ['Meu Plano', 'Minha Geladeira']),

            const SizedBox(height: 20),

            Expanded(
              child: TabBarView(
                children: [
                  _myPlan(),
                  ListView(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    children: [
                      HeaderRefrigerator(),
                      const SizedBox(height: 20),
                      ListView.separated(
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 10),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: refrigeratorMock.length,
                        itemBuilder: (context, index) {
                          final item = refrigeratorMock[index];
                          return RefrigeratorItem(
                            item: item.item,
                            uni: item.uni,
                            iconColor: item.healthFood == 'Alto'
                                ? AppColors.green200
                                : item.healthFood == 'Médio'
                                ? AppColors.yellow200
                                : AppColors.red200,
                          );
                        },
                      ),
                      const SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 15,
                        ),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [AppColors.green200, Color(0xFF059669)],
                          ),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: AppColors.gray100),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.05),
                              blurRadius: 2,
                              offset: const Offset(0, 1),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(MdiIcons.chefHat, color: AppColors.white),
                                SizedBox(width: 10),
                                Text(
                                  'Sugestão do Chef IA',
                                  style: Theme.of(context).textTheme.titleLarge
                                      ?.copyWith(color: AppColors.white),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {},
                                child: const Text('Adicionar Refeição'),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
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
      padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(bottom: 20),
      itemBuilder: (context, index) {
        if (index == dailyDietMock.length) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 12),
              child: NoticeCard(
                text: "Nota: Este plano é personalizado. Evite substituições sem consultar seu nutricionista.",
                icon: FontAwesomeIcons.circleExclamation,
                iconColor: AppColors.yellow200,
                textColor: AppColors.yellow200,
                backgroundColor: AppColors.yellow50,
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
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemCount: dailyDietMock.length + 1,
    );
  }
}



class RefrigeratorItem extends StatelessWidget {
  final String item;
  final String uni;
  final Color iconColor;
  const RefrigeratorItem({
    super.key,
    required this.item,
    required this.uni,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.gray100),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(
          item,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text(
            uni,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: AppColors.gray500),
          ),
        ),
        trailing: Icon(Icons.circle, color: iconColor, size: 16),
      ),
    );
  }
}

class HeaderRefrigerator extends StatelessWidget {
  const HeaderRefrigerator({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Expanded(
              child: RefrigeratorCard(
                title: '850',
                subtitle: 'KCAL DISPONÍVEIS',
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: RefrigeratorCard(
                title: 'ALTO',
                titleColor: AppColors.green200,
                subtitle: 'POTENCIAL PROTEICO',
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Dispensa & Geladeira',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            TextButton.icon(
              style: TextButton.styleFrom(
                splashFactory: NoSplash.splashFactory,
                foregroundColor: AppColors.green200,
                iconColor: AppColors.green200,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
              ),
              clipBehavior: Clip.none,
              onPressed: () {},
              icon: Icon(Icons.add),
              label: Text(
                'Adicionar',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.green200,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
