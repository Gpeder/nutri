import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nutri/core/theme/colors.dart';
import 'package:nutri/screens/home/widgets/card_helth_refrigerator.dart';
import 'package:nutri/screens/home/widgets/card_home.dart';
import 'package:nutri/screens/home/widgets/container_water_controller.dart';
import 'package:nutri/screens/home/widgets/home_appbar.dart';
import 'package:nutri/screens/home/widgets/training_card.dart';


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
          horizontal: 20,
          vertical: 12,
        ),
        child: Column(
          children: [
            const SizedBox(height: 12),
            _containerscardhome(),
            const SizedBox(height: 20),
            CardHelthRefrigerator(percent: 0.75),
            const SizedBox(height: 20),
            ContainerWaterController(),
            const SizedBox(height: 20),

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
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  LayoutBuilder _containerscardhome() {
    return LayoutBuilder(
      builder: (context, constraints) {
        double cardWidth = (constraints.maxWidth - 12) / 2;
        return Wrap(
          spacing: 12,
          runSpacing: 12,
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
