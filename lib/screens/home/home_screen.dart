import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nutri/core/theme/colors.dart';
import 'package:nutri/screens/home/widgets/card_home.dart';
import 'package:nutri/screens/home/widgets/home_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      body: SingleChildScrollView(
        padding: .symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            LayoutBuilder(
              builder: (context, constraints) {
                return Wrap(
                  children: [
                    CardHome(
                      icon: FontAwesomeIcons.shoePrints,
                      value:'2.560',
                      subtitle: 'Passos hoje',
                      bgColor: AppColors.green50,
                      iconColor: AppColors.green200,
                      borderColor: AppColors.green200,
                    ),
                    CardHome(
                      icon: FontAwesomeIcons.shoePrints,
                      value:'2.560',
                      subtitle: 'Passos hoje',
                      bgColor: AppColors.green50,
                      iconColor: AppColors.green200,
                      borderColor: AppColors.green200,
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
