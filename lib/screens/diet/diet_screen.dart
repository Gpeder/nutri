import 'package:flutter/material.dart';
import 'package:nutri/screens/diet/widgets/snackcard.dart';
import 'package:nutri/widgets/genericappbar.dart';
import 'package:nutri/screens/diet/widgets/custom_tab_bar.dart';

import 'package:nutri/services/model/snackmodel.dart';

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
                  ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(
                      bottom: 20,
                    ),
                    itemBuilder: (context, index) {
                      final snack = dailyDietMock[index];
                      return SnackCard(
                        title: snack.title,
                        time: snack.time,
                        items: snack.items,
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 15),
                    itemCount: dailyDietMock.length,
                  ),
                  Center(child: Text("Conteúdo da Cozinha")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
