import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nutri/core/theme/colors.dart';
import 'package:nutri/core/theme/app_theme.dart';
import 'package:nutri/screens/profile_pages/widgets/bioimpedance_table.dart';
import 'package:nutri/screens/profile_pages/widgets/card_body_data.dart';
import 'package:nutri/widgets/genericappbar.dart';
import 'package:nutri/widgets/notice_cards.dart';

class BodyData extends StatelessWidget {
  const BodyData({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: GenericAppBar(
        icon: FontAwesomeIcons.angleLeft,
        title: 'Meus dados',
        subtitle: 'Base para cálculo da sua dieta',
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            _cardsBodyData(isDark),
            const SizedBox(height: 20),
            BioimpedanceTable(
              isDark: isDark,
              datebioimpedance: '10/OUT',
              wheightNow: '82.5 kg',
              bodyFat: '30%',
              muscleMass: '38 kg',
              metabolicRate: '1850 kcal',
            ),
            const SizedBox(height: 20),
            NoticeCard(
              text: "Estes dados foram medidos pela Dra. Ana. Para alterar, é necessário realizar uma nova avaliação física.",
              icon: FontAwesomeIcons.heartPulse,
              iconColor: AppColors.blue200,
              textColor: AppColors.blue200,
              backgroundColor: AppColors.blue50,
            ),
          ],
        ),
      ),
    );
  }

  LayoutBuilder _cardsBodyData(bool isDark) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double cardWidth = (constraints.maxWidth - 12) / 2;
        return Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            SizedBox(
              width: cardWidth,
              child: CardBodyData(
                isDark: isDark,
                title: 'Idade',
                subtitle: '28 anos',
                icon: FontAwesomeIcons.calendar,
                iconColor: AppColors.blue200,
                bgColor: AppColors.blue100,
                sizeIcon: 20,
              ),
            ),
            SizedBox(
              width: cardWidth,
              child: CardBodyData(
                isDark: isDark,
                title: 'Altura',
                subtitle: '1.75m',
                icon: FontAwesomeIcons.ruler,
                iconColor: AppColors.green200,
                bgColor: AppColors.green100,
                sizeIcon: 20,
              ),
            ),
          ],
        );
      },
    );
  }
}
