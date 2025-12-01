import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:awesome_bottom_bar/widgets/inspired/inspired.dart';
import 'package:flutter/material.dart';
import 'package:nutri/core/theme/colors.dart';
import 'package:nutri/screens/data/data_screen.dart';
import 'package:nutri/screens/diet/diet_screen.dart';
import 'package:nutri/screens/home/home_screen.dart';
import 'package:nutri/screens/profile/profile.dart';
import 'package:nutri/screens/training/training_screen.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int _selectedIndex = 0;

  final List<Widget> _telas = [
    const HomeScreen(),
    const DietScreen(),
    const TrainingScreen(),
    const DataScreen(),  
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _telas[_selectedIndex],

      bottomNavigationBar: BottomBarInspiredOutside(
        items: const [
          TabItem(icon: Icons.home, title: "Home"),
          TabItem(icon: Icons.restaurant, title: "Refeições"),
          TabItem(icon: Icons.fitness_center, title: "Treino"),
          TabItem(icon: Icons.bar_chart, title: "Evolução"),
          TabItem(icon: Icons.person, title: "Perfil"),
        ],
        backgroundColor: Theme.of(context).bottomNavigationBarTheme.backgroundColor!,
        color: AppColors.gray400,
        duration: Duration(milliseconds: 200),
        colorSelected: AppColors.white,
        elevation: 5,
        iconSize: 24,
        curve: Curves.easeInOut,
        itemStyle: ItemStyle.circle,
        isAnimated: true,
        animated: true,
        borderRadius: BorderRadius.circular(10),
        chipStyle: ChipStyle(
          background: AppColors.green200,
          notchSmoothness: NotchSmoothness.defaultEdge,
        ),
        indexSelected: _selectedIndex,
        onTap: _onItemTapped, 
      ),
    );
  }
}