import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nutri/core/theme/colors.dart';
import 'package:nutri/screens/home/widgets/card_helth_refrigerator.dart';
import 'package:nutri/screens/home/widgets/card_home.dart';
import 'package:nutri/screens/home/widgets/container_water_controller.dart';
import 'package:nutri/screens/home/widgets/home_appbar.dart';
import 'package:nutri/screens/home/widgets/training_card.dart';


import 'package:nutri/core/theme/app_spacings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isTrainingDone = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacings.lg,
          vertical: AppSpacings.sm,
        ),
        child: Column(
          children: [
            const SizedBox(height: AppSpacings.sm),
            _containerscardhome(),
            const SizedBox(height: AppSpacings.lg),
            CardHelthRefrigerator(percent: 0.25),
            const SizedBox(height: AppSpacings.lg),
            ContainerWaterController(),
            const SizedBox(height: AppSpacings.lg),

            TrainingCard(
              backgroundColor: AppColors.yellow50,
              borderColor: AppColors.yellow100,
              accentColor: AppColors.yellow200,
              value: _isTrainingDone,
              onChanged: (value) {
                setState(() {
                  _isTrainingDone = value ?? false;
                });
              },
              onTap: () {
                setState(() {
                  _isTrainingDone = !_isTrainingDone;
                });
              },
              title: 'Treino diário',
              subtitle: 'Costas/Peito',
              icon: FontAwesomeIcons.dumbbell,
            ),
          ],
        ),
      ),
    );
  }

  LayoutBuilder _containerscardhome() {
    return LayoutBuilder(
      builder: (context, constraints) {
        double cardWidth = (constraints.maxWidth - AppSpacings.sm) / 2;
        return Wrap(
          spacing: AppSpacings.sm,
          runSpacing: AppSpacings.sm,
          children: [
            SizedBox(
              width: cardWidth,
              child: CardHome(
                icon: FontAwesomeIcons.shoePrints,
                value: '4.250',
                subtitle: 'Passos hoje',
                bgColor: AppColors.blue50,
                iconColor: AppColors.blue200,
                borderColor: AppColors.blue100,
              ),
            ),
            SizedBox(
              width: cardWidth,
              child: CardHome(
                icon: FontAwesomeIcons.heartPulse,
                value: '-64kg',
                subtitle: 'Perdidos até agora',
                bgColor: AppColors.green50,
                iconColor: AppColors.green200,
                borderColor: AppColors.green100,
              ),
            ),
          ],
        );
      },
    );
  }
}
